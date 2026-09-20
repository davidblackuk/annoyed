#include <cpctelera.h>
#include "h/powerups.h"
#include "h/globals.h"
#include "h/bat.h"
#include "h/balls.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

#define POWERUP_FALL_DY 1   // world px/frame - ~3.8s to cross the play
                             // height at 50fps, tune by playtesting

Powerup all_powerups[MAX_POWERUPS];

void store_powerup_background(Powerup *p);
void restore_powerup_background(Powerup *p);
char *powerup_letter(u8 type);

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void powerups_initialize()
{
    Powerup *p = all_powerups;
    for (u8 i = 0; i < MAX_POWERUPS; i++)
    {
        p->active = 0;
        p->x = p->y = p->prev_x = p->prev_y = 0;
        p++;
    }
}

void powerups_spawn(u8 type, i16 world_x, i16 world_y)
{
    Powerup *p = all_powerups;

    if (type == POWERUP_NONE)
    {
        return;
    }

    for (u8 i = 0; i < MAX_POWERUPS; i++)
    {
        if (!p->active)
        {
            p->type = type;
            p->x = world_x;
            p->y = world_y;
            p->prev_x = world_x;
            p->prev_y = world_y;
            p->active = 1;
            return;
        }
        p++;
    }
}

void powerups_update()
{
    Powerup *p = all_powerups;
    for (u8 i = 0; i < MAX_POWERUPS; i++)
    {
        if (p->active)
        {
            p->prev_x = p->x;
            p->prev_y = p->y;
            p->y += POWERUP_FALL_DY;

            if (bat_is_catching(p->x, p->y, SP_POW_GREEN_W, SP_POW_GREEN_H))
            {
                if (p->type == POWERUP_EXPAND)
                {
                    bat_apply_expand();
                }
                else if (p->type == POWERUP_DISRUPTION)
                {
                    balls_split(balls_get_first_active());
                }

                // erase immediately - once active drops to 0 this slot is
                // never restored again, so the last-drawn frame would
                // otherwise remain a permanent ghost
                restore_powerup_background(p);
                p->active = 0;
            }
            else if (p->y >= YOUR_DEAD_Y)
            {
                // missed - same immediate-erase requirement as above
                restore_powerup_background(p);
                p->active = 0;
            }
        }
        p++;
    }
}

void powerups_restore_background()
{
    Powerup *p = all_powerups;
    for (u8 i = 0; i < MAX_POWERUPS; i++)
    {
        if (p->active)
        {
            restore_powerup_background(p);
        }
        p++;
    }
}

void powerups_store_background()
{
    Powerup *p = all_powerups;
    for (u8 i = 0; i < MAX_POWERUPS; i++)
    {
        if (p->active)
        {
            store_powerup_background(p);
        }
        p++;
    }
}

void powerups_draw()
{
    Powerup *p = all_powerups;
    for (u8 i = 0; i < MAX_POWERUPS; i++)
    {
        if (p->active)
        {
            u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(p->x), W_2_S_Y(p->y));
            cpct_drawSprite(sp_pow_green, svmem, SP_POW_GREEN_W, SP_POW_GREEN_H);

            text_write_string(W_2_S_X(p->x) + 1, W_2_S_Y(p->y), powerup_letter(p->type));
        }
        p++;
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

void store_powerup_background(Powerup *p)
{
    u8 *buffer = p->background;

    for (u8 y = 0; y < POWERUP_FOOTPRINT_H; y++)
    {
        u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(p->x), W_2_S_Y(p->y + y));
        for (u8 x = 0; x < POWERUP_FOOTPRINT_W; x++)
        {
            *buffer = *svmem;
            buffer++;
            svmem++;
        }
    }
}

void restore_powerup_background(Powerup *p)
{
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(p->prev_x), W_2_S_Y(p->prev_y));
    cpct_drawSprite(p->background, svmem, POWERUP_FOOTPRINT_W, POWERUP_FOOTPRINT_H);
}

char *powerup_letter(u8 type)
{
    switch (type)
    {
    case POWERUP_EXPAND:
        return "E";
    case POWERUP_DISRUPTION:
        return "D";
    default:
        return "?";
    }
}
