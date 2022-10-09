
#include <cpctelera.h>
#include <map/tiles.h>                  // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01-blocks.h>  
#include "h/bricks.h"
#include "h/balls.h"
#include "h/globals.h"
u8 *p_block_v_mem;

//
//  Draw the tile map for the bricks layer over the background. this is a one off initialization.
//    
//  We take the tile map definition and use this to initialize a further map that convers tile numbers into 
//   tile meta data, including the score for the brick position, visibility, type etc. 
//
void bricks_initialize() {
    p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
    cpct_etm_drawTilemap2x4_f(g_tilemap_l00_blocks_W, g_tilemap_l00_blocks_H, p_block_v_mem, g_tilemap_l00_blocks);
}

//
// Tests for and handles collisions with of ball with tiles. Since a ball can touch multiple tiles and require
// multiple backgound tiles to be restore to make it disappear, we queue the restores in the backgound  renderer
//
void bricks_handle_ball_intersection(Ball *ball) {

}

void bricks_restore(u8 x, u8 y, u8 width, u8 height) {

}