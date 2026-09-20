

#include <cpctelera.h>
#include "h/keys.h"
#include "h/bat.h"
#include "h/background.h"
#include "h/globals.h"
#include "sprites/bat-mid.h"
#include "h/masked-sprites.h"
#include <map/tiles.h> // Tile declarations      (file generated after processing img/tiles.png)

///
/// Bat module. The bat moves left and right as steered by user input or in the auto
/// play mode, where the bat is moved to center on the ball.
///
/// This module has been converted to use zero based coordinates, where 0,0 is the
/// top left of the play area. THis is the area inside the side walls, regardless of
/// location on the screen.
///
/// Rendering is the only place that translates world to screen.

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

#define BAT_HEIGHT_PIXELS 8
#define BAT_BOTTOM_OFFSET_PIXELS 8
#define BAT_SEGMENT_WIDTH_PIXELS 4
#define BAT_SEGMENT_WIDTH_BYTES 2

// matches the ball's fastest possible dx (see balls.h) so the autoplay bat
// can never be outrun by the ball, however hard the ball is bounced
#define AUTO_BAT_MAX_STEP 2

#define NORMAL_BAT_WIDTH 8
#define BAT_EXPANDED_WIDTH 16   // double width; stays a multiple of
                                 // BAT_SEGMENT_WIDTH_BYTES, well inside
                                 // PLAY_AREA_WIDTH
#define EXPAND_DURATION_FRAMES 750   // ~15s @ 50fps

u8 batY = 0;
u8 batX = 0;
u8 oldBatX = 0;
u8 batW = 0;
u8 oldBatW = 0;
u16 expand_timer = 0;

void bat_recenter_to_width(u8 new_width);

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void bat_initialize()
{
    batW = NORMAL_BAT_WIDTH;
    batX = (PLAY_AREA_WIDTH - batW) / 2;
    batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
    oldBatX = batX;
    oldBatW = batW;
    expand_timer = 0;
}

// snapshot the position/width the bat was last actually drawn at, before
// anything this frame's update() gets a chance to change either. Must run
// exactly once, right at the start of level_update() - before auto_update/
// bat_update/powerups_update, all of which can move and/or resize the bat
// (sometimes more than one of them in the very same frame, e.g. the Expand
// timer expiring and a fresh capsule being caught on the same frame).
// Capturing once up front, rather than scattered across every mutator,
// guarantees bat_restore_background() always sees the true last-drawn
// footprint no matter how many of those changes land in one frame.
void bat_begin_frame()
{
    oldBatX = batX;
    oldBatW = batW;
}

void bat_update()
{
    if (key_left_is_pressed)
    {
        if (batX > 0)
        {
            batX--;
        }
    }
    else if (key_right_is_pressed)
    {
        if (batX < PLAY_AREA_WIDTH - batW)
        {
            batX++;
        }
    }

    if (expand_timer > 0)
    {
        expand_timer--;
        if (expand_timer == 0)
        {
            bat_recenter_to_width(NORMAL_BAT_WIDTH);
        }
    }
}

void bat_move_towards(i16 target_x)
{
    if (target_x < 0)
    {
        target_x = 0;
    }
    else if (target_x > PLAY_AREA_WIDTH - batW)
    {
        target_x = PLAY_AREA_WIDTH - batW;
    }

    if (target_x > batX)
    {
        u8 step = ((target_x - batX) > AUTO_BAT_MAX_STEP) ? AUTO_BAT_MAX_STEP : (u8)(target_x - batX);
        batX += step;
    }
    else if (target_x < batX)
    {
        u8 step = ((batX - target_x) > AUTO_BAT_MAX_STEP) ? AUTO_BAT_MAX_STEP : (u8)(batX - target_x);
        batX -= step;
    }
}

void bat_restore_background()
{
    // Restore the union of the old and new footprints, so the old sprite
    // is always fully erased regardless of how far the bat moved this
    // frame (autoplay can jump it up to AUTO_BAT_MAX_STEP px) AND
    // regardless of whether its width changed this frame too (Expand
    // growing/reverting) - oldBatX/oldBatW capture exactly what was last
    // actually drawn on screen, batX/batW is what's about to be drawn now.
    u8 left = (oldBatX < batX) ? oldBatX : batX;
    u8 old_right = oldBatX + oldBatW;
    u8 new_right = batX + batW;
    u8 right = (old_right > new_right) ? old_right : new_right;

    background_restore_world_coords(left, batY, right - left, BAT_HEIGHT_PIXELS);
}

void bat_draw()
{
    u8 *svmem;
    u8 mid_segments;

    svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));

    cpct_drawSpriteMasked(sp_masked_bat_left, svmem, SP_BAT_SEG_W, SP_BAT_SEG_H);

    // batW==8 (the normal width) gives mid_segments==2, drawn at the same
    // two offsets as the original hardcoded version - Expand just widens
    // this loop rather than needing new art
    mid_segments = (batW / BAT_SEGMENT_WIDTH_BYTES) - 2;
    for (u8 i = 0; i < mid_segments; i++)
    {
        cpct_drawSprite(sp_bat_mid, svmem + (1 + i) * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
    }

    cpct_drawSpriteMasked(sp_masked_bat_right, svmem + (1 + mid_segments) * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_SEG_W, SP_BAT_SEG_H);
}

BounceHits bat_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
{
    BounceHits bounces = BOUNCE_NONE;

    if (ball->dy > 0 &&
        (ball->x + BALL_WIDTH > batX && ball->x < batX + batW) &&
        (ball->y + BALL_HEIGHT > batY && ball->y < batY + SP_BAT_SEG_H))
    {
        // Steer the ball based on which of the bat's 4 visual segments it
        // struck (edges kick it out sharply, the middle two segments give
        // a shallower angle), like the original Arkanoid paddle.
        i16 offset = (ball->x + (BALL_WIDTH / 2)) - batX;
        u8 segment;

        if (offset < 0)
        {
            offset = 0;
        }
        else if (offset >= batW)
        {
            offset = batW - 1;
        }

        // scale the 4 rebound zones proportionally to the current bat
        // width, rather than assuming a fixed 8-byte bat, so a widened
        // (Expand) bat still gets 4 distinct zones instead of everything
        // past the original segment 2 landing in the sharpest-angle
        // default case - identical result to the old fixed-width formula
        // when batW is the normal 8
        segment = (u8)((offset * 4) / batW);
        if (segment > 3)
        {
            segment = 3;
        }

        // dy is set here too (rather than left to the automatic sign-flip
        // below) so overall ball speed stays close to the serve speed for
        // most hits, only picking up a little extra pace off the edges -
        // not a big jump on every single bounce.
        switch (segment)
        {
        case 0:
            ball->dx = -2;
            ball->dy = 2;
            break;
        case 1:
            ball->dx = -1;
            ball->dy = 2;
            break;
        case 2:
            ball->dx = 1;
            ball->dy = 2;
            break;
        default:
            ball->dx = 2;
            ball->dy = 2;
            break;
        }

        bounces |= BOUNCE_Y;
    }

    return bounces;
}

u8 bat_is_catching(i16 x, i16 y, u8 w, u8 h)
{
    return (x + w > batX && x < batX + batW &&
            y + h > batY && y < batY + BAT_HEIGHT_PIXELS);
}

void bat_apply_expand()
{
    if (batW != BAT_EXPANDED_WIDTH)
    {
        bat_recenter_to_width(BAT_EXPANDED_WIDTH);
    }

    // catching a second Expand while already expanded just refreshes the
    // duration rather than stacking
    expand_timer = EXPAND_DURATION_FRAMES;
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

// re-centres the bat on its current middle at a new width, clamped to stay
// within the play area - used by both bat_apply_expand (growing) and the
// expand_timer expiry (shrinking back), so growth and reversion look
// symmetric rather than snapping to one edge
void bat_recenter_to_width(u8 new_width)
{
    i16 center = batX + (batW / 2);
    i16 new_x = center - (new_width / 2);

    if (new_x < 0)
    {
        new_x = 0;
    }
    else if (new_x + new_width > PLAY_AREA_WIDTH)
    {
        new_x = PLAY_AREA_WIDTH - new_width;
    }

    batX = (u8)new_x;
    batW = new_width;
}
