
#include "h/globals.h"
#include "sprites/life-marker.h"
#include "h/game.h"
#include "cpctelera.h"
// ---------------------------------------------------------------------------
// private declarations
// ---------------------------------------------------------------------------

void hud_initialize_internal(u8 is_restart);

#define HUD_LEFT 68

// ---------------------------------------------------------------------------
// public implementations
// ---------------------------------------------------------------------------

void hud_initialize()
{
    hud_initialize_internal(FALSE);
}

void hud_continue_from_death()
{
    hud_initialize_internal(TRUE);
}

void hud_update()
{
}

void hud_restore_background()
{
}

void hud_draw()
{
}

// ---------------------------------------------------------------------------
// private implementations
// ---------------------------------------------------------------------------

void hud_initialize_internal(u8 is_restart)
{
    u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8; 
    
    for (u8 i = 0; i < lives_left; i++)
    {
        u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
        u8 y = initial_y + ((i / 2) * 8);

        u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
        cpct_drawSprite(sp_life, pvmem, SP_LIFE_W, SP_LIFE_H);
    }
}