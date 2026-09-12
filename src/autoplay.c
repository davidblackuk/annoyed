#include "h/bat.h"
#include "h/balls.h"
#include "h/keys.h"
#include "h/globals.h"
#include "h/debug.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

u8 is_controling;

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

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void auto_initialize()
{
    is_controling = 0;
    auto_hit_zone = 0;
    auto_prev_ball_dy = 0;
}

void auto_update()
{
    if (key_auto_is_pressed)
    {
        is_controling = is_controling ? 0 : 1;
    }

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
                u8 zone_width = batW / AUTO_HIT_ZONES;
                i16 target_offset;
                i16 ball_centre_x;
                i16 target_bat_x;

                // a downward bounce turning upward while close to bat height
                // is a paddle hit - rotate to the next strike zone so the
                // next approach lands on a different part of the bat
                if (auto_prev_ball_dy > 0 && ball->dy < 0 &&
                    ball->y > batY - AUTO_BAT_PROXIMITY)
                {
                    auto_hit_zone = (auto_hit_zone + 1) % AUTO_HIT_ZONES;
                }

                target_offset = (auto_hit_zone * zone_width) + (zone_width / 2);
                ball_centre_x = ball->x + (BALL_WIDTH / 2);
                target_bat_x = ball_centre_x - target_offset;

                // move directly rather than via the 1px/frame key path -
                // bat_move_towards can keep pace with the ball's fastest
                // possible dx (2px/frame, from an edge hit), which plain
                // key-driven movement cannot, so a hard bounce off an edge
                // zone can never outrun the bat
                bat_move_towards(target_bat_x);
            }

            auto_prev_ball_dy = ball->dy;
        }
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
