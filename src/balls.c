#include <cpctelera.h>
#include "h/masked-sprites.h"
#include "h/bat.h"
#include "h/blocks.h"
#include "h/background.h"
#include "h/debug.h"
#include "h/globals.h"
#include "h/keys.h"
#include "h/balls.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// module storage

Ball all_balls[MAX_BALLS];

u8 serving;

void initialize_balls();
void store_bacgkround(Ball *ball);
void restore_bacgkround(Ball *ball);
void center_ball(Ball *ball);
void handle_serve(Ball *ball);
void update_ball(Ball *ball);

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

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
            restore_bacgkround(ball);
        }
        ball++;
    }
}

// captures the background under each active ball's current position. Must
// run after blocks_draw() but before bat_draw() - if it captured after the
// bat was drawn, a ball overlapping the bat (as it does on every paddle
// bounce) would snapshot bat pixels instead of the true background, and
// later restore_bacgkround() would stamp that fragment onto the screen
// permanently once the ball and bat had both moved away from that spot.
void balls_store_background()
{
    Ball *ball = all_balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            store_bacgkround(ball);
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

            cpct_drawSpriteMasked(sp_masked_ball, svmem, SP_BALL_W, SP_BALL_H);
        }
        ball++;
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

// @brief for autoplay targeting: which active ball most urgently needs the
// bat's attention - the lowest (largest y) among those currently descending
// toward the bat, falling back to the first active ball when none are
// descending or only one ball is up. Doesn't multi-target, just avoids
// fixating on a ball that's moving away while another is about to arrive.
Ball *balls_get_most_urgent_active()
{
    Ball *ball = all_balls;
    Ball *best = NULL;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        if (ball->active)
        {
            if (best == NULL)
            {
                best = ball;
            }
            else if (ball->dy > 0 && (best->dy <= 0 || ball->y > best->y))
            {
                best = ball;
            }
        }
        ball++;
    }
    return best;
}

// @brief Disruption power-up: activate up to 2 currently-inactive balls at
// source's position with fixed diverging dx, same dy as source.
void balls_split(Ball *source)
{
    u8 spawned = 0;
    Ball *ball = all_balls;

    if (source == NULL)
    {
        return;
    }

    for (u8 i = 0; i < MAX_BALLS && spawned < 2; i++)
    {
        if (ball != source && !ball->active)
        {
            // spawn at source->prev_x/y (what's actually on screen right
            // now, matching source->background below), not source->x/y -
            // balls_update() already ran earlier this frame, so source->x/y
            // is already its *next*, not-yet-drawn position
            ball->x = source->prev_x;
            ball->y = source->prev_y;
            ball->prev_x = ball->x;
            ball->prev_y = ball->y;
            ball->dy = source->dy;
            ball->dx = (spawned == 0) ? -2 : 2;
            ball->active = 1;

            // bootstrap its background buffer by copying source's, NOT by
            // reading the live screen (store_bacgkround) - at this point in
            // update(), this frame's draw() has already happened, so the
            // *source* ball's own sprite is still visually sitting at this
            // exact shared position. Reading the screen here would capture
            // a copy of the source ball's sprite pixels as "background",
            // which gets restored as a frozen ghost ball once this new ball
            // has moved on a couple of frames later. source->background is
            // already a valid true-background snapshot for source->prev_x/y
            // (captured normally, before the source ball itself was ever
            // drawn there), so copying it is correct by construction.
            for (u8 b = 0; b < BALL_WIDTH * BALL_HEIGHT; b++)
            {
                ball->background[b] = source->background[b];
            }

            spawned++;
        }
        ball++;
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

void initialize_balls()
{
    // mark all balls other than ball 0 as inactive and located at 0,0
    Ball *ball = all_balls;
    for (u8 i = 0; i < MAX_BALLS; i++)
    {
        ball->active = 0;
        ball->x = 0;
        ball->y = 0;
        ball->prev_x = 0;
        ball->prev_y = 0;
        ball->dx = 0;
        ball->dy = 0;
        store_bacgkround(ball);
        ball++;
    }

    // mark the first ball as active.
    all_balls[0].active = 1;
}

void center_ball(Ball *ball)
{
    // initialize previous coords to current x,y: for background replacement
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

    // set the ball delta to 2 pixels up and 1 pixel right (1 byte)
    ball->dx = 1;
    ball->dy = -2;

    // initialixe previous coords to current for background replacement
    ball->prev_x = ball->x;
    ball->prev_y = ball->y;
}

void  update_ball(Ball *ball)
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
            // ball lost or life lost, or game over. Restore its background
            // immediately - once active drops to 0, balls_restore_background()
            // only restores active balls, so this one would otherwise leave
            // its last-drawn sprite as a permanent ghost. Harmless today
            // (losing the only ball always clears the whole screen via the
            // next level_initialize_internal()), but a real bug once
            // Disruption lets some balls die while others stay in play.
            restore_bacgkround(ball);
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


void store_bacgkround(Ball *ball)
{
    u8 *buffer = ball->background;

    // TODO: Good candidate for hand writted assembly language optimization, later
    for (u8 y=0; y< BALL_HEIGHT; y++) {
        u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START,
                                    W_2_S_X(ball->x),
                                    W_2_S_Y(ball->y + y));
        *buffer = *svmem;
        buffer++;
        svmem++;

        *buffer = *svmem;
        buffer++;
        svmem++;

        *buffer = *svmem;
        buffer++;
        svmem++;
    }
}

void restore_bacgkround(Ball *ball)
{
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START,
                                    W_2_S_X(ball->prev_x),
                                    W_2_S_Y(ball->prev_y));
    cpct_drawSprite(ball->background, svmem, BALL_WIDTH, BALL_HEIGHT);
}
