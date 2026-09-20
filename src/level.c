
#include "h/level.h"
#include "cpctelera.h"
#include <h/globals.h>
#include "h/bat.h"
#include "h/balls.h"
#include "h/background.h"
#include "h/blocks.h"
#include "h/keys.h"
#include "h/autoplay.h"
#include "h/powerups.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

void level_initialize_internal(u8 is_restart);

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

/// @brief initialize the level from scratch
void level_initialize()
{
    level_initialize_internal(FALSE);
}

/// @brief initialize the level but keep any blocks that were previously removed
void level_continue_from_death()
{
    level_initialize_internal(TRUE);
}

void level_draw()
{
    // restore the background of moving items. powerups must restore before
    // blocks do: a block a capsule is currently falling past can be
    // destroyed this same frame (during update(), which runs after draw()),
    // and blocks_restore_background() is deliberately the last restore call
    // so it has final say over any tile a stale ball/capsule snapshot might
    // have briefly resurrected.
    bat_restore_background();
    balls_restore_background();
    powerups_restore_background();
    blocks_restore_background();

    // draw that which must be drawn
    blocks_draw();

    // capture ball/powerup backgrounds before the bat is drawn, so a ball
    // or capsule overlapping the bat (as on every paddle bounce, or every
    // catch) never snapshots bat pixels into its restore buffer - see
    // balls_store_background
    balls_store_background();
    powerups_store_background();

    bat_draw();
    balls_draw();
    powerups_draw();
}

SceneState level_update()
{

    SceneState res = Continue;

    do
    {
        keys_update();
    } while (key_pause_is_pressed);

    // snapshot the bat's last-drawn footprint before anything below can
    // move/resize it - see bat_begin_frame's own comment for why this must
    // happen exactly once, up front, rather than scattered per-mutator
    bat_begin_frame();

    auto_update();
    bat_update();
    balls_update();
    powerups_update();

    // if there are no active balls left, we're dead
    if (balls_get_first_active() == NULL)
    {
        res = LevelCompleteFail;
    }
    if (blocks_remaining == 0)
    {
        res = LevelCompleteSuccess;
    }

    return res;
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

void level_initialize_internal(u8 is_restart)
{
    cpct_clearScreen(AN_PEN_BLACK);

    background_initialize();
    blocks_initialize(is_restart);

    // autoplay's on/off state is decided by the caller (see game.c) - a
    // fresh game always starts with it off, but it should carry over as-is
    // across a level advance or a life-lost continue
    keys_initialize();
    bat_initialize();
    balls_initialize();
    powerups_initialize();
}
