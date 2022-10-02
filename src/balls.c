#include <cpctelera.h>
#include "sprites/ball.h"
#include "h/balls_p.h"
#include "h/bat.h"
#include "h/background.h"
#include "h/debug.h"
#include "h/globals.h"
#include "h/keys.h"

/* ---------------------------------------------------------------------
    Public methods
   --------------------------------------------------------------------- */

void balls_initialize()
{
    // we start the level in serving mode, ball attached to the bat
    serving = 1;

    // mark all balls other than ball 0 as inactive
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        balls[i].active = 0;
        balls[i].x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
        balls[i].y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
        balls[i].prev_x = TILE_MAP_SCREEN_BYTE_OFFSET_X;
        balls[i].prev_y = TILE_MAP_SCREEN_PIXEL_OFFSET_Y;
        balls[i].dx = 1;
        balls[i].dy = 0;
    }
    balls[0].active = 1;

    // center ball 0
    center_ball(balls);
}

void balls_update()
{
    Ball *ball = balls;
    if (serving)
    {
        center_ball(ball);
        if (key_serve_is_pressed)
        {
            serving = 0;
            ball->dx = 1; // 45 degrees right
            ball->dy = -2;
            ball->prev_x = ball->x;
            ball->prev_y = ball->y;
        }
    }
    else
    {
        for (u8 i = 0; i < MAX_BALLS; i++)
        {
            update_ball(ball);
            ball++;
        }
    }
}

void balls_restore_background()
{
    Ball *ball = balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            restoreBackground(ball->prev_x, balls->prev_y, SP_BALL_W, SP_BALL_H);
        }
        ball++;
    }
}

void balls_draw()
{
    u8 *svmem;
    Ball *ball = balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (balls->active)
        {
            svmem = cpct_getScreenPtr(CPCT_VMEM_START, balls->x, balls->y);
            cpct_drawSprite(sp_ball, svmem, SP_BALL_W, SP_BALL_H);
        }
    }
}

Ball * balls_get_first_active() {
    Ball *ball = balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            return ball;
        }
        ball++;
    }
    return NULL;
}


/* ---------------------------------------------------------------------
    Private methods
   --------------------------------------------------------------------- */
void center_ball(Ball *ball)
{
    ball->prev_x = ball->x;
    ball->prev_y = ball->y;
    ball->x = batX + (batW / 4);
    ball->y = batY - SP_BALL_H;
}

void update_ball(Ball *ball)
{
    ball->prev_x = ball->x;
    ball->prev_y = ball->y;

    if (ball->active)
    {
        u8 new_x = ball->x + ball->dx;
        u8 new_y = ball->y + ball->dy;
        if (ball->dx > 0)
        {
            if (new_x >= PLAY_AREA_RIGHT_EDGE - SP_BALL_W)
            {
                ball->x = PLAY_AREA_RIGHT_EDGE - SP_BALL_W;
                ball->dx = -ball->dx;
            }
            else
            {
                ball->x = new_x;
            }
        }
        else
        {

            if (new_x <= PLAY_AREA_LEFT_EDGE)
            {
                ball->x = PLAY_AREA_LEFT_EDGE;
                ball->dx = -ball->dx;
            }
            else
            {
                ball->x = new_x;
            }
        }

        if (ball->dy < 0)
        {
            if (new_y <= PLAY_AREA_TOP_EDGE)
            {
                ball->y = PLAY_AREA_TOP_EDGE;
                ball->dy = -ball->dy;
            }
            else
            {
                ball->y = new_y;
            }
        }
        else
        {
            if (new_y >= YOUR_DEAD_PIXEL_ROW)
            {
//                ball->active = 0;
                ball->dy = -ball->dy;
            }
            else
            {
                ball->y = new_y;
            }
        }

    }
}
