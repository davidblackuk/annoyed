
#include "cpctelera.h"
#include <h/globals.h>
#include <h/level.h>
#include <h/game.h>

Scene scene_game;

SceneState current_state;

u8 current_level_num;
u8 lives_left;

void initialise_level();

void game_initialize()
{
    current_level_num = 0;
    lives_left = 3;
    current_state = Continue;
    initialise_level();    

    cpct_setBorder(HW_LIME);
}

void game_draw()
{
    level_draw();

    // score draw
    // lives draw

    // if state == life lost) draw something?

}

SceneState game_update()
{
    SceneState res = Continue;

    res = level_update();
    // score update
    // lives update
    if (res == LevelCompleteSuccess) {

    } else if (res == LevelCompleteFail) {
        initialise_level();
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
}