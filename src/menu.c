
#include "h/level.h"

#include <h/globals.h>
#include "sprites/annoyed.h"
#include <cpctelera.h>

#include "h/keys.h"
#include "h/text.h"

#define COLOR_CYCLE_FREQ 10

Scene scene_menu;

u8 loop_counter;
u8 current_ink;

void menu_initialize()
{
    u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
    cpct_clearScreen(AN_PEN_BLACK);
    
    keys_initialize();

    loop_counter = 0;
    cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);


}

void menu_draw()
{
    text_write_string(0,64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
    text_write_string(0,76, "YOUR SPACESHIP IS IN TROUBLE.");

    text_write_string(0,96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
    text_write_string(0,108, "REMOVE BLOCKS FROM A WALL USING A BALL.");


    text_write_string(0,132, "YEAH, WE KNOW...");

    text_write_string(0,156, "WASD OR ARROW KEYS TO PLAY. UP TO SERVE");

   text_write_centered_string(200-8, "PRESS ANY OLD KEY TO START");

}

SceneState menu_update()
{
    keys_update();
    if (cpct_isAnyKeyPressed())
    {
        return SceneComplete;
    }

    return Continue;
}

void module_menu_initialize()
{
    scene_menu.initialize = menu_initialize;
    scene_menu.update = menu_update;
    scene_menu.draw = menu_draw;
}

