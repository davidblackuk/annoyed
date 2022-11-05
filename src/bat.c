

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

void bat_restore_background()
{
    background_restore_world_coords(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
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
        bounces |= BOUNCE_Y;
    }

    return bounces;
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
