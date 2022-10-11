#include <types.h>

#include "h/globals.h"
#include "h/game.h"
#include "h/level.h"

#include <map/level-01-background.h>
#include <map/level-01-blocks.h>
#include <map/level-02-background.h>
#include <map/level-02-blocks.h>

const Level level_definitions[NUM_LEVELS] = {
    {   // level 1
        g_tilemap_l01_background,       // void *background_tilemap;
        g_tilemap_l01_blocks,           //  void *blocks_tilemap;
        50,                             // steel_score (50*level_number)
        2,                              // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
    },
    {   // level 2
        g_tilemap_l02_background,       // void *background_tilemap;
        g_tilemap_l02_blocks,           //  void *blocks_tilemap;
        100,                            // steel_score (50*level_number)
        2,                              // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
    }};

// The global current level
Level * current_level;