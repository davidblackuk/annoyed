
#include "cpctelera.h"
#include <h/globals.h>
#include <h/level.h>
#include <h/game.h>

Scene scene_game;

SceneState current_state;

u8 current_level_num;
u8 lives_left;
i16 score;

void initialise_level();

void game_initialize()
{
    current_level_num = 0;
    lives_left = INITIAL_LIVES;
    current_state = Continue;
    initialise_level();    
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

void initialise_level() {
    current_level = level_definitions + current_level_num;
    level_initialize();
    hud_initialize();
}