
#include "h/level.h"

#include <h/globals.h>
#include "sprites/annoyed.h"
#include <cpctelera.h>

#include "h/keys.h"
#include "h/text.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

void game_over_win_write_text();

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

Scene scene_game_over_win;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void game_over_win_initialize()
{
    u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
    cpct_clearScreen(AN_PEN_BLACK);

    keys_initialize();

    cpct_drawSprite((void *)sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
    game_over_win_write_text();
}

void game_over_win_draw()
{
}

SceneState game_over_win_update()
{
    keys_update();
    if (cpct_isAnyKeyPressed())
    {
        return SceneComplete;
    }

    return Continue;
}

void module_game_over_win_initialize()
{
    scene_game_over_win.initialize = game_over_win_initialize;
    scene_game_over_win.update = game_over_win_update;
    scene_game_over_win.draw = game_over_win_draw;
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

void game_over_win_write_text()
{
    text_write_centered_string(64, "GOOD DOG, HAVE A BISCUIT");

}
