
#include <cpctelera.h>
#include "sprites/ball.h"
#include "entities/bat.h"
#include "background/background.h"
#include "debug.h"

// forward declare our private methods
void center_ball(u8 ball);
void update_ball(u8 ball);

// module declarations
#define MAX_BALLS 3

typedef struct
{
    u8 active;      // is this ball being rendered?
    u8 x;           // current screen byte X
    u8 y;           // current screen row/pixel Y

    u8 prev_x;          // the previous screen byte X used to erase the background
    u8 prev_y;          // the previous screen row/pixel Y used to erase the background

    u8 dx;          // the balls byte delta x [-2 .. 2 and != 0]
    u8 dy;          // the balls row delta y [-4 .. 4 and != 0]

} Ball;

// module storage
Ball balls[MAX_BALLS];

u8 serving;

void balls_initialize()
{
    // we start the level in serving mode
    serving = 1;

    // mark all balls other than ball 0 as inactive
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        balls[i].active = 0;
        balls[i].x = 0;
        balls[i].y = 0;
        balls[i].prev_x = 0;
        balls[i].prev_y = 0;
        balls[i].dx = 1;
        balls[i].dy = 0;

    }
    balls[0].active = 1;
    center_ball(0);
}

void balls_update()
{
    if (serving)
    {
        center_ball(0);
        if (cpct_isKeyPressed(Key_CursorUp))
        {
            serving = 0;
            balls[0].dx = 1;    // 45 degrees right
            balls[0].dy = -2;
            balls[0].prev_x = balls[0].x;
            balls[0].prev_y = balls[0].y;
        }
    }
    else
    {
        for (u8 i = 0; i < MAX_BALLS; i++)
        {
            update_ball(i);
        }
    }
}

void balls_restore_background()
{
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (balls[i].active) {
             restoreBackground(balls[i].prev_x, balls[i].prev_y, SP_BALL_W, SP_BALL_H);


            //drawNumber((1 * 100) + 32);
        }
    }
}

void balls_draw()
{
    u8 *svmem;
    Ball *ball = balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            svmem = cpct_getScreenPtr(CPCT_VMEM_START, ball->x, ball->y);
            cpct_drawSprite(sp_ball, svmem, SP_BALL_W, SP_BALL_H);
        }
        ball++;
    }
}

/*
 */
void center_ball(u8 ball)
{
    balls[ball].prev_x = balls[ball].x;
    balls[ball].prev_y = balls[ball].y;
    balls[ball].x = batX + (batW / 4);
    balls[ball].y = batY - SP_BALL_H - 100;
}

void update_ball(u8 ball)
{
    if (balls[ball].active) {
         balls[ball].prev_x = balls[ball].x;
         balls[ball].prev_y = balls[ball].y;

        balls[ball].x += balls[ball].dx;
        balls[ball].y += balls[ball].dy;
    }
}
