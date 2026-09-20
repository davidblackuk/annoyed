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

// power-up carrier blocks for level 1. Positions verified directly against
// the generated src/map/level-01-blocks.c tile data (GID-1 values): row 6
// is a single-hit ORANGE_BLOCK row, row 8 a single-hit MAGENTA_BLOCK row,
// both spanning columns 0..24 - avoided row 0 (STEEL_BLOCK, takes 2 hits)
// for predictability. See BLOCK_TOP_WORLD_Y/plant_tile_meta for how these
// tile coordinates map to a spawn position.
const PowerupCarrier level_01_carriers[] = {
    {2, 6, POWERUP_EXPAND},       // orange row, near the left
    {18, 8, POWERUP_DISRUPTION},  // magenta row, near the right
};
#define LEVEL_01_CARRIER_COUNT (sizeof(level_01_carriers) / sizeof(PowerupCarrier))

const Level level_definitions[NUM_LEVELS] = {
    {
        // level 1
        g_tilemap_l01_background, // void *background_tilemap;
        g_tilemap_l01_blocks,     // void *blocks_tilemap;
        5,                        // steel_score (50*level_number), scores are divided by 10
        2,                        // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
        level_01_carriers,        // const PowerupCarrier *carriers;
        LEVEL_01_CARRIER_COUNT,   // u8 carrier_count;
    },
    {
        // level 2
        g_tilemap_l02_background, // void *background_tilemap;
        g_tilemap_l02_blocks,     // void *blocks_tilemap;
        10,                       // steel_score (50*level_number), scores are divided by 10
        2,                        // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
        NULL,                     // const PowerupCarrier *carriers; - none yet
        0,                        // u8 carrier_count;
    },
    {
        // level 3
        g_tilemap_l03_background, // void *background_tilemap;
        g_tilemap_l03_blocks,     // void *blocks_tilemap;
        15,                       // steel_score (50*level_number), scores are divided by 10
        2,                        // steel_hits_to_destroy (2 initially then 1 extra every 8 levels )
        NULL,                     // const PowerupCarrier *carriers; - none yet
        0,                        // u8 carrier_count;
    }};

// The global current level
const Level *current_level;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
