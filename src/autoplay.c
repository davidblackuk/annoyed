#include "h/bat.h"
#include "h/balls.h"
#include "h/keys.h"
#include "h/globals.h"
#include "h/debug.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

u8 is_controling;

// tracks the previous frame's key_auto_is_pressed so the toggle below only
// fires once per press - without this, holding the key for more than one
// frame (~50 times/sec) flips is_controling back and forth repeatedly and
// leaves it in whatever state it happened to land on at release
u8 auto_key_was_pressed;

// Autoplay rotates which of these zones across the bat's width it aims the
// ball at, rather than always centering the ball on the bat. Always hitting
// dead centre produces the same rebound angle every time (see
// bat_bounce_ball's segment steering), which can settle into a repeating
// path that never reaches some blocks - rotating the strike zone on every
// paddle hit keeps the trajectory varying so the level can always finish.
#define AUTO_HIT_ZONES 4

u8 auto_hit_zone;
i16 auto_prev_ball_dy;

// how close to bat height a downward-to-upward bounce has to be to count as
// a paddle hit rather than the ball bouncing off the underside of a block
#define AUTO_BAT_PROXIMITY 12

i16 predict_ball_x_at_bat(Ball *ball);

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void auto_initialize()
{
    is_controling = 0;
    auto_hit_zone = 0;
    auto_prev_ball_dy = 0;
    auto_key_was_pressed = 0;
}

void auto_update()
{
    if (key_auto_is_pressed && !auto_key_was_pressed)
    {
        is_controling = is_controling ? 0 : 1;
    }
    auto_key_was_pressed = key_auto_is_pressed;

    if (is_controling)
    {
        Ball *ball = balls_get_first_active();

        keys_resetAllKeys();
        if (ball != NULL)
        {
            if (serving)
            {
                key_serve_is_pressed = 1;
            }
            else
            {
                // a downward bounce turning upward while close to bat height
                // is a paddle hit - rotate to the next strike zone so the
                // next approach lands on a different part of the bat
                if (auto_prev_ball_dy > 0 && ball->dy < 0 &&
                    ball->y > batY - AUTO_BAT_PROXIMITY)
                {
                    auto_hit_zone = (auto_hit_zone + 1) % AUTO_HIT_ZONES;
                }

                if (ball->dy < 0)
                {
                    // ball is heading away from the bat (just been hit, or
                    // bounced off the underside of a block) - like a squash
                    // player returning to the centre of the court, park in
                    // the middle and wait rather than chasing its every
                    // wiggle off the side walls
                    bat_move_towards((PLAY_AREA_WIDTH - batW) / 2);
                }
                else
                {
                    // ball is descending towards the bat - predict where it
                    // will actually arrive (accounting for any remaining
                    // wall bounces) and glide straight there, rather than
                    // re-aiming at its current, zig-zagging position every
                    // frame. If a block deflects it unexpectedly, this is
                    // recomputed fresh next frame from the new trajectory.
                    u8 zone_width = batW / AUTO_HIT_ZONES;
                    i16 target_offset = (auto_hit_zone * zone_width) + (zone_width / 2);
                    i16 predicted_centre_x = predict_ball_x_at_bat(ball) + (BALL_WIDTH / 2);

                    bat_move_towards(predicted_centre_x - target_offset);
                }
            }

            auto_prev_ball_dy = ball->dy;
        }
    }
}



// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

/// Predict the ball's (left-edge) world x when it reaches bat height,
/// assuming a straight run with only side-wall bounces (blocks aren't
/// modelled - if one deflects the ball this is simply wrong for one frame
/// and self-corrects, since it's recomputed from scratch every frame).
/// Uses the classic "unfold and reflect" trick: extend the straight-line
/// path past the walls, then fold it back into the play area.
i16 predict_ball_x_at_bat(Ball *ball)
{
    i16 frames_to_bat;
    i16 unfolded_x;
    i16 max_x;
    i16 period;
    i16 folded;

    frames_to_bat = (batY - ball->y) / ball->dy;
    if (frames_to_bat < 0)
    {
        frames_to_bat = 0;
    }

    unfolded_x = ball->x + (ball->dx * frames_to_bat);

    max_x = PLAY_AREA_WIDTH - BALL_WIDTH;
    period = 2 * max_x;

    folded = unfolded_x % period;
    if (folded < 0)
    {
        folded += period;
    }

    if (folded > max_x)
    {
        folded = period - folded;
    }

    return folded;
}
