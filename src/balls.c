#include <cpctelera.h>
#include "sprites/ball.h"
#include "sprites/bat-left.h"
#include "h/bat.h"
#include "h/blocks.h"
#include "h/background.h"
#include "h/debug.h"
#include "h/globals.h"
#include "h/keys.h"
#include "h/debug.h"

// -----------------------------------------------------------------
// Module private members
// -----------------------------------------------------------------

#define MAX_BALLS 3

// module storage
Ball all_balls[MAX_BALLS];

u8 serving;

void initialize_balls();
void center_ball(Ball *ball);
void handle_serve(Ball *ball);
void update_ball(Ball *ball);

/* ---------------------------------------------------------------------
    Public methods
   --------------------------------------------------------------------- */

void balls_initialize()
{
    // we start the level in serving mode, ball attached to the bat
    serving = 1;

    initialize_balls();

    // center ball 0
    center_ball(all_balls);
}

void balls_update()
{
    Ball *ball = all_balls;
    if (serving)
    {
        center_ball(ball);
        if (key_serve_is_pressed)
        {
            handle_serve(ball);
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
    Ball *ball = all_balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            background_restore_world_coords(ball->prev_x, ball->prev_y, SP_BALL_W, SP_BALL_H);
        }
        ball++;
    }
}

void balls_draw()
{
    u8 *svmem;
    Ball *ball = all_balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(ball->x), W_2_S_Y(ball->y));
            cpct_drawSprite(sp_ball, svmem, SP_BALL_W, SP_BALL_H);
            ball++;
        }
    }
}

Ball *balls_get_first_active()
{
    Ball *ball = all_balls;
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

void initialize_balls()
{
    // mark all balls other than ball 0 as inactive and located at 0,0
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        all_balls[i].active = 0;
        all_balls[i].x = 0;
        all_balls[i].y = 0;
        all_balls[i].prev_x = 0;
        all_balls[i].prev_y = 0;
        all_balls[i].dx = 0;
        all_balls[i].dy = 0;
    }

    // mar the first ball as active.
    all_balls[0].active = 1;
}

void center_ball(Ball *ball)
{
    // initialixe previous coords to current x,y: for background replacement
    ball->prev_x = ball->x;
    ball->prev_y = ball->y;

    // balls current xy is cet to cener of the bat and the ball height above
    ball->x = batX + (batW / 4);
    ball->y = batY - SP_BALL_H;
}

void handle_serve(Ball *ball)
{
    // mark that we are no longer serving
    serving = 0;

    // set the ball delta to 2 pixels up and 2 pixels right (1 byte)
    ball->dx = 1;
    ball->dy = -2;

    // initialixe previous coords to current for background replacement
    ball->prev_x = ball->x;
    ball->prev_y = ball->y;
}

void update_ball(Ball *ball)
{
    ball->prev_x = ball->x;
    ball->prev_y = ball->y;

    if (ball->active)
    {
        BounceHits hits = BOUNCE_NONE;
        i16 new_x = ball->x + ball->dx;
        i16 new_y = ball->y + ball->dy;

        if (new_y >= YOUR_DEAD_Y)
        {
            // ball lost or life lost, or game over
            ball->active = 0;
            ball->dy = 0;
            return;
        }

        hits |= background_bounce_ball(new_x, new_y);
        hits |= bat_bounce_ball(ball, new_x, new_y);
        hits |= blocks_bounce_ball(ball, new_x, new_y);

        if (hits & BOUNCE_X)
        {
            ball->dx = -ball->dx;
        }
        else
        {
            ball->x = new_x;
        }

        if (hits & BOUNCE_Y)
        {
            ball->dy = -ball->dy;
        }
        else
        {
            ball->y = new_y;
        }
    }
}
