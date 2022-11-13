
#include "cpctelera.h"
#include <h/globals.h>
#include <h/level.h>
#include <h/game.h>
#include "sprites/pow-green.h"
// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

Scene scene_game;

SceneState current_state;

u8 current_level_num;
u8 lives_left;
u16 current_score;
u16 high_score;

void initialise_level();
void temp();
// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void game_initialize()
{
    current_level_num = 0;
    current_score = 0;
    lives_left = INITIAL_LIVES;
    current_state = Continue;
    initialise_level();    
}

void game_draw()
{
    level_draw();

    hud_draw();


    temp();
}

void temp() {
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(20), W_2_S_Y(55));
    cpct_drawSprite(sp_pow_green, svmem, SP_POW_GREEN_W, SP_POW_GREEN_H);

    svmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(20), W_2_S_Y(120));
    cpct_drawSprite(sp_pow_green, svmem, SP_POW_GREEN_W, SP_POW_GREEN_H);
}

SceneState game_update()
{
    SceneState res = Continue;

    res = level_update();
    hud_update();
    // score update
    // lives update
    if (res == LevelCompleteSuccess) {
        current_level_num += 1;
        if (current_level_num >= NUM_LEVELS) {
            return GameOver;
        }
        initialise_level();
        res = Continue;

    } else if (res == LevelCompleteFail) {
        lives_left -= 1;
        if (lives_left == 0) {
            return GameOver;
        }
        level_continue_from_death();
        hud_continue_from_death();
        res = Continue;
    }


    return res;
}

void module_game_initialize()
{
    scene_game.initialize = game_initialize;
    scene_game.update = game_update;
    scene_game.draw = game_draw;
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

void initialise_level() {
    current_level = level_definitions + current_level_num;
    level_initialize();
    hud_initialize();
}