
#include <cpctelera.h>
#include <map/tiles.h> // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01-blocks.h>
#include "h/blocks.h"
#include "h/balls.h"
#include "h/globals.h"
#include "sprites/ball.h"
#include "h/debug.h"
u8 *p_block_v_mem;

u8 min_x;
u8 min_y;
u8 max_x;
u8 max_y;

BlockMeta block_meta[BLOCKS_MAP_W / 2][BLOCKS_MAP_H / 2];

// -----------------------------------------------------
// Private function declarations
// -----------------------------------------------------
void map_tiles_to_meta();
void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy);

//
//  Draw the tile map for the blocks layer over the background. this is a one off initialization.
//
//  We take the tile map definition and use this to initialize a further map that convers tile numbers into
//   tile meta data, including the score for the brick position, visibility, type etc.
//
void blocks_initialize()
{
    p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
    cpct_etm_drawTilemap2x4_f(g_tilemap_l01_blocks_W, g_tilemap_l01_blocks_H, p_block_v_mem, current_level->blocks_tilemap);

    // create a structure defining whats blocks are on the screen
    map_tiles_to_meta();

    min_x = 0xFF;
    min_y = 0xFF;
    max_x = 0x00;
    max_y = 0x00;
}

void blocks_draw()
{
    //    p_block_v_mem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W, TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y);
    //     cpct_etm_drawTilemap2x4_f(g_tilemap_l01_blocks_W, g_tilemap_l01_blocks_H, p_block_v_mem, current_level->blocks_tilemap);
}

void blocks_restore_background()
{
}

void blocks_intersect_ball(Ball *ball)
{

    // test the big bounding box first to avoid wasting cycles
    if ((ball->y + SP_BALL_H < TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y) ||
        (ball->y > TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y + (BLOCKS_MAP_H * TILE_H)))
    {
        return;
    }

    {
        u8 ball_center_x = ball->x + (SP_BALL_W / 2);
        u8 ball_center_y = ball->y + (SP_BALL_W / 2);

        u8 tx = (ball_center_x - (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2)) / 4;
        u8 ty = (ball_center_y - (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y)) / 8;

        u8 rx = (ball->x - (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2)) % 4;
        u8 ry = (ball->y - (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y)) % 8;

    u8* pvmem = cpct_getScreenPtr(CPCT_VMEM_START, tx*2  + (TILE_MAP_SCREEN_BYTE_OFFSET_X + 2 * TILE_W), (ty*4) + (TILE_MAP_SCREEN_PIXEL_OFFSET_Y + BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y));
    cpct_drawSolidBox(pvmem, 255, 2,4);

        dbg_displayNumber(0, tx);
        dbg_displayNumber(1, ty);

        if (tx < min_x)
            min_x = tx;
        if (tx > max_x)
            max_x = tx;
        if (ty < min_y)
            min_y = ty;
        if (ty > max_y)
            max_y = ty;

        dbg_displayNumber(3, min_x);
        dbg_displayNumber(4, max_x);

        dbg_displayNumber(6, min_y);
        dbg_displayNumber(7, max_y);

        if (block_meta[tx][ty].is_active)
        {
            ball->dy = -ball->dy;
            block_meta[tx][ty].is_active = 0;
        }
    }
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
            u8 tile = current_level->blocks_tilemap[y * BLOCKS_MAP_W + x];
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
}