
#include <cpctelera.h>
#include <map/tiles.h> // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01-blocks.h>
#include "h/blocks.h"
#include "h/balls.h"
#include "h/globals.h"
#include "sprites/ball.h"
#include "h/debug.h"
#include "h/background.h"

u8 *p_block_v_mem;

BlockMeta block_meta[BLOCKS_MAP_W / 2][BLOCKS_MAP_H / 2];

// -----------------------------------------------------
// Private function declarations
// -----------------------------------------------------
void map_tiles_to_meta();
void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy);
BlockMeta *get_metaData_at(i16 x, i16 y);

//
//  Draw the tile map for the blocks layer over the background. this is a one off initialization.
//
//  We take the tile map definition and use this to initialize a further map that convers tile numbers into
//   tile meta data, including the score for the brick position, visibility, type etc.
//
void blocks_initialize()
{
    p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
                                      BRICKS_MAP_PIXEL_TOP_SCR);

    cpct_etm_drawTilemap2x4_f(BLOCKS_MAP_W, BLOCKS_MAP_H,
                              p_block_v_mem, current_level->blocks_tilemap);

    // create a structure defining whats blocks are on the screen
    map_tiles_to_meta();
}

void blocks_draw()
{
}

void blocks_restore_background()
{
}

BounceHits blocks_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
{
    BlockMeta *meta;
    BounceHits bounces = BOUNCE_NONE;
    i16 tx, ty;
    u8 mx, my;

    // are we above or below the tilemap for blocks, if so no collision 
    // is possible
    if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR || 
        W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR) {
        return BOUNCE_NONE;
    }

    meta = get_metaData_at(at_x, at_y);
    if (meta) {
        //meta->is_active = 0;

         background_debug_box_wc((meta->block_tile_x) * TILE_W,
          (meta->block_tile_y * TILE_H)+24, BALL_WIDTH, BALL_HEIGHT);

        // background_restore_world_coords((meta->block_tile_x + 2) * TILE_W,
        //   (meta->block_tile_y * TILE_H)+24, BALL_WIDTH, BALL_HEIGHT);
    }



    return bounces;
}

BlockMeta *get_metaData_at(i16 x, i16 y) {
    BlockMeta *meta;
    i16 tx, ty;
    i16 mx, my;

    // tile map x is the world x/2 for 2/4 tiles, the blocks map is the 
    // same width as the play area and located at x = 0, so no adjustment.
    tx = (x / 2);

    // tile map y is the world y/4 for 2/4 tiles, it is also offset 
    // down the screen 6 tiles,so we need to adjust for that
    ty = ((y ) / 4) - 6;

    // blocks are 2x2 tiles so we divide out to get the index of the tile
    // in the meta data array
    mx = tx /2;
    my = ty / 2;

    meta = &block_meta[mx][my];
    if (meta -> is_active) {
        return meta;
    }
    return NULL;
}



// -----------------------------------------------------
// Private function implementations
// -----------------------------------------------------

//
// extract from the tilemap the block definitions
//
void map_tiles_to_meta()
{

    // we only need check the tile index of the top left tile of each potential block
    for (u8 y = 0; y < BLOCKS_MAP_H; y += 2)
    {
        for (u8 x = 0; x < BLOCKS_MAP_W; x += 2)
        {
            u8 tile = current_level->blocks_tilemap[(y * BLOCKS_MAP_W) + x];
            switch (tile)
            {
            case WHITE_BLOCK:
                plant_tile_meta(x, y, WHITE_BLOCK, WHITE_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case ORANGE_BLOCK:
                plant_tile_meta(x, y, ORANGE_BLOCK, ORANGE_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case CYAN_BLOCK:
                plant_tile_meta(x, y, CYAN_BLOCK, CYAN_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case GREEN_BLOCK:
                plant_tile_meta(x, y, GREEN_BLOCK, GREEN_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case RED_BLOCK:
                plant_tile_meta(x, y, RED_BLOCK, RED_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case BLUE_BLOCK:
                plant_tile_meta(x, y, BLUE_BLOCK, BLUE_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case MAGENTA_BLOCK:
                plant_tile_meta(x, y, MAGENTA_BLOCK, MAGENTA_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case YELLOW_BLOCK:
                plant_tile_meta(x, y, YELLOW_BLOCK, YELLOW_SCORE, SINGLE_HIT_TO_REMOVE);
                break;
            case STEEL_BLOCK:
                plant_tile_meta(x, y, STEEL_BLOCK, current_level->steel_hits_to_destroy, current_level->steel_score);
                break;
            case GOLD_BLOCK:
                plant_tile_meta(x, y, GOLD_BLOCK, 0, INDESTRUCTABLE);
                break;
            default:
                // any other tile set index is none / inactive / transparent
                block_meta[x / 2][y / 2].is_active = 0;
                block_meta[x / 2][y / 2].score = 0;
                block_meta[x / 2][y / 2].remaining_hits = 0;

                break;
            }
        }
    }
}

void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy)
{
    block_meta[map_x / 2][map_y / 2].is_active = 1;
    block_meta[map_x / 2][map_y / 2].score = score;
    block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
    block_meta[map_x / 2][map_y / 2].type = tile_type;
    block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
    block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
}