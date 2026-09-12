

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

u8 batY = 0;
u8 batX = 0;
u8 oldBatX = 0;
u8 batW = 0;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void bat_initialize()
{
    batW = 8;
    batX = (PLAY_AREA_WIDTH - batW) / 2;
    batY = PLAY_AREA_HEIGHT - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
    oldBatX = batX;
}

void bat_update()
{
    if (key_left_is_pressed)
    {
        if (batX > 0)
        {
            oldBatX = batX;
            batX--;
        }
    }
    else if (key_right_is_pressed)
    {
        if (batX < PLAY_AREA_WIDTH - batW)
        {
            oldBatX = batX;
            batX++;
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

    oldBatX = batX;

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
    // Restoring only oldBatX (with width batW) is exactly correct for a
    // 1px/frame move, but autoplay can jump the bat up to
    // AUTO_BAT_MAX_STEP px in one frame. Restore the union of the old and
    // new footprints instead, so the old sprite is always fully erased
    // regardless of how far it moved this frame.
    u8 restore_x = (oldBatX < batX) ? oldBatX : batX;
    u8 spread = (oldBatX < batX) ? (batX - oldBatX) : (oldBatX - batX);

    background_restore_world_coords(restore_x, batY, batW + spread, BAT_HEIGHT_PIXELS);
}

void bat_draw()
{
    u8 *svmem;

    svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(batX), W_2_S_Y(batY));

    cpct_drawSpriteMasked(sp_masked_bat_left, svmem, SP_BAT_SEG_W, SP_BAT_SEG_H);

    cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
    cpct_drawSprite(sp_bat_mid, svmem + 2 * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);

    cpct_drawSpriteMasked(sp_masked_bat_right, svmem + 3 * BAT_SEGMENT_WIDTH_BYTES, SP_BAT_SEG_W, SP_BAT_SEG_H);
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
        segment = offset / BAT_SEGMENT_WIDTH_BYTES;

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

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
