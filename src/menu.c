
#include "h/level.h"

#include <h/globals.h>
#include "sprites/annoyed.h"
#include <cpctelera.h>

#include "h/keys.h"

#define COLOR_CYCLE_FREQ 10



void menu_print_message(u8 x, u8 y, u8 fg, char *message);

Scene scene_menu;

const u8 fg_pens[4] = {AN_PEN_WHITE, AN_PEN_PASTEL_CYAN, AN_PEN_SKY_BLUE, AN_PEN_PASTEL_MAGENTA};

u8 loop_counter;
u8 current_ink;

void menu_initialize()
{
    u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 16);

    keys_initialize();

    loop_counter = 0;
    cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);



    menu_print_message(4, 90, AN_PEN_PASTEL_CYAN, "\xf2 or a: move left");
    menu_print_message(4, 105, AN_PEN_PASTEL_MAGENTA, "\xf3 or d: move right");
    menu_print_message(4, 120, AN_PEN_PASTEL_YELLOW, "\xf0 or w: serve");
}

void menu_draw()
{
    void *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 14, SCREEN_HEIGHT_ROWS - 16);

    cpct_setDrawCharM0(fg_pens[current_ink], 0);
    cpct_drawStringM0("Press any key", pvmem);
}

SceneState menu_update()
{
    keys_update();
    if (cpct_isAnyKeyPressed())
    {
        return SceneComplete;
    }

    loop_counter += 1;
    if (loop_counter > COLOR_CYCLE_FREQ)
    {
        loop_counter = 0;
        current_ink = (current_ink + 1) % 4;
    }

    return Continue;
}

void module_menu_initialize()
{
    scene_menu.initialize = menu_initialize;
    scene_menu.update = menu_update;
    scene_menu.draw = menu_draw;
}

void menu_print_message(u8 x, u8 y, u8 fg, char *message)
{
    u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    cpct_setDrawCharM0(fg, AN_PEN_BLACK);
    cpct_drawStringM0(message, pvmem);
}