#include <types.h>

#include "h/globals.h"
#include "h/game.h"
#include "h/level.h"

#include "map/debug-background.h"
#include "map/debug-blocks.h"

#include <map/level-01-background.h>
#include <map/level-01-blocks.h>
#include <map/level-02-background.h>
#include <map/level-02-blocks.h>
#include <map/level-03-background.h>
#include <map/level-03-blocks.h>

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

const Level level_definitions[NUM_LEVELS] = {
    {
        // level 1
        g_tilemap_l01_background, // void *background_tilemap;
        g_tilemap_l01_blocks,     // void *blocks_tilemap;
        5,                        // steel_score (50*level_number), scores are divided by 10
        2,                        // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
    },
    {
        // level 2
        g_tilemap_l02_background, // void *background_tilemap;
        g_tilemap_l02_blocks,     // void *blocks_tilemap;
        10,                       // steel_score (50*level_number), scores are divided by 10
        2,                        // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
    },
    {
        // level 3
        g_tilemap_l03_background, // void *background_tilemap;
        g_tilemap_l03_blocks,     // void *blocks_tilemap;
        15,                       // steel_score (50*level_number), scores are divided by 10
        2,                        // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
    }};

// The global current level
Level *current_level;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
