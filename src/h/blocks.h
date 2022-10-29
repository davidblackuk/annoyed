#ifndef _BLOCKS_H
#define _BLOCKS_H

#include <types.h>
#include "h/globals.h"
#include "map/level-01-blocks.h"
#include "balls.h"



// there always the same dimension fo pick it up from level 1
#define BLOCKS_MAP_W g_tilemap_l01_blocks_W
#define BLOCKS_MAP_H g_tilemap_l01_blocks_H

#define BLOCK_HEIGHT 8
#define BLOCK_WIDTH  4


// how far below the top of the background tile map are the bricks placed
#define BRICKS_MAP_PIXEL_TOP_SCR 24
#define BRICKS_MAP_PIXEL_BOTTOM_SCR (BRICKS_MAP_PIXEL_TOP_SCR + (g_tilemap_l01_blocks_H * TILE_H))

/// @brief Initialize the blocks for the level
/// @param is_restart is this a restart? if so we keep the block states from the current run, 
///         otherwise we initialize the blocks from the level definition
extern void blocks_initialize(u8 is_restart);

extern void blocks_draw();

extern void blocks_restore_background();


extern BounceHits blocks_bounce_ball(Ball * ball, i16 at_x, i16 at_y);


#define WHITE_BLOCK 0
#define ORANGE_BLOCK 2
#define CYAN_BLOCK 4
#define GREEN_BLOCK 6
#define RED_BLOCK 8
#define BLUE_BLOCK 10
#define MAGENTA_BLOCK 12
#define YELLOW_BLOCK 14
#define STEEL_BLOCK 16
#define GOLD_BLOCK 18

#define WHITE_SCORE 50
#define ORANGE_SCORE 60
#define CYAN_SCORE 70
#define GREEN_SCORE 80
#define RED_SCORE 90
#define BLUE_SCORE 100
#define MAGENTA_SCORE 110
#define YELLOW_SCORE 120
#define GOLD_SCORE 0


#define SINGLE_HIT_TO_REMOVE 1
#define INDESTRUCTABLE 0xFF

typedef struct {
    u8 is_active;
    u8 type;
    u8 score;
    u8 remaining_hits;

    u8 block_tile_x;
    u8 block_tile_y;
} BlockMeta;


#endif
