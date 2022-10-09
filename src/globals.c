#include <types.h>

#include "h/globals.h"
#include "h/game.h"
#include "h/level.h"

#include <map/level-01-background.h>
#include <map/level-01-blocks.h>
#include <map/level-02-background.h>
#include <map/level-02-blocks.h>

const Level level_definitions[NUM_LEVELS] = {
    {
        g_tilemap_l01_background,       // void *background_tilemap;
        g_tilemap_l01_blocks,           //  void *blocks_tilemap;
    },
    {
        g_tilemap_l02_background,       // void *background_tilemap;
        g_tilemap_l02_blocks,           //  void *blocks_tilemap;
    }};

// The global current level
Level * current_level;