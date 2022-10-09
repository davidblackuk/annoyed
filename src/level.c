
#include "h/level.h"
#include "cpctelera.h"
#include <h/globals.h>
#include "h/bat.h"
#include "h/balls.h"
#include "h/background.h"
#include "h/bricks.h"
#include "h/keys.h"
#include "h/autoplay.h"



void level_initialize()
{
    cpct_clearScreen(AN_PEN_BLACK);

    background_initialize();
    bricks_initialize();
    auto_initialize();

    keys_initialize();
    bat_initialize();
    balls_initialize();
}

void level_draw()
{
    // restore the background of moving items
    bat_restore_background();
    balls_restore_background();

    // draw that which must be drawn
    bat_draw();
    balls_draw();
}

SceneState level_update()
{
    SceneState res = Continue;
    keys_update();
    auto_update();
    bat_update();
    balls_update();

    // if there are no active balls left, we're dead
    if (balls_get_first_active() == NULL) {
        res = LevelCompleteFail;
    }

    return res;
}

