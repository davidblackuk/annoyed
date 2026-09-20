
#include "cpctelera.h"
#include <h/globals.h>
#include <h/level.h>
#include <h/game.h>
#include <h/autoplay.h>
// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

Scene scene_game;

SceneState current_state;

u8 current_level_num;
u8 lives_left;
u16 current_score;
u16 high_score;

void initialise_level(u8 is_new_game);
// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void game_initialize()
{
    current_level_num = 0;
    current_score = 0;
    lives_left = INITIAL_LIVES;
    current_state = Continue;
    initialise_level(TRUE);
}

void game_draw()
{
    level_draw();

    hud_draw();
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
            return GameOverWin;
        }
        initialise_level(FALSE);
        res = Continue;

    } else if (res == LevelCompleteFail) {
        lives_left -= 1;
        if (lives_left == 0) {
            return GameOverLoose;
        }
        level_continue_from_death();
        auto_reset_for_level();
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

void initialise_level(u8 is_new_game) {
    current_level = level_definitions + current_level_num;
    level_initialize();

    // a brand new game always starts with autoplay off; advancing to a new
    // level keeps autoplay however the player currently has it set
    if (is_new_game) {
        auto_initialize();
    } else {
        auto_reset_for_level();
    }

    hud_initialize();
}