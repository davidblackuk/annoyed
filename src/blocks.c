
#include <cpctelera.h>
#include <map/tiles.h> // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01-blocks.h>
#include "h/blocks.h"
#include "h/balls.h"
#include "h/globals.h"
#include "h/debug.h"
#include "h/background.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

void map_blocks_to_meta();
void draw_current_blocks();

void plant_tile_meta(u8 map_x, u8 map_y, u8 tile_type, u8 score, u8 hits_to_destroy);
BlockMeta *get_metaData_at(i16 wx, i16 wy);
BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType);

BlockMeta block_meta[BLOCKS_MAP_W / 2][BLOCKS_MAP_H / 2];

u16 blocks_remaining;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

//
// Draw the tile map for the blocks layer over the background. this is a one 
// off initialization.
//
// We take the tile map definition and use this to initialize a further map 
// that converts tile numbers into tile meta data, including the score for 
// the brick position, visibility, type etc.
//
void blocks_initialize(u8 is_restart)
{
    if (!is_restart)
    {
        // create a structure defining what blocks are on the screen
        map_blocks_to_meta();
    }

    // render the block map tile by tile to the screen so that levels can be 
    // continued after a life is lost, with a partial board
    draw_current_blocks();
}

void blocks_draw()
{
}

void blocks_restore_background()
{
}

BounceHits blocks_bounce_ball(Ball *ball, i16 at_x, i16 at_y)
{

    BounceHits bounces = BOUNCE_NONE;

    // are we above or below the tilemap for blocks, if so no collision
    // is possible
    if (W_2_S_Y(at_y) < BRICKS_MAP_PIXEL_TOP_SCR ||
        W_2_S_Y(at_y) > BRICKS_MAP_PIXEL_BOTTOM_SCR)
    {
        return BOUNCE_NONE;
    }

    if (ball->dy < 0)
    {
        // going up
        bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_Y);
        bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_Y);
    }
    else
    {
        // going down
        bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_Y);
        bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_Y);
    }

    if (ball->dx < 0)
    {
        // going left
        bounces |= is_ball_colliding_with_block(ball, at_x, at_y, BOUNCE_X);
        bounces |= is_ball_colliding_with_block(ball, at_x, at_y + 6, BOUNCE_X);
    }
    else
    {
        // going right
        bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y, BOUNCE_X);
        bounces |= is_ball_colliding_with_block(ball, at_x + 3, at_y + 6, BOUNCE_X);
    }

    return bounces;
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

BounceHits is_ball_colliding_with_block(Ball *ball, i16 wx, i16 wy, BounceHits bounceType)
{
    BounceHits bounces = BOUNCE_NONE;
    BlockMeta *meta;

    meta = get_metaData_at(wx, wy);
    if (meta)
    {
        if (meta->remaining_hits != INDESTRUCTABLE) {
            if (meta->remaining_hits > 1) {
                meta->remaining_hits -= 1;
            } else {
                meta->remaining_hits = 0;
                meta->is_active = 0;
                blocks_remaining -= 1;
            }
        }


        background_debug_box_wc((meta->block_tile_x) * TILE_W,
                                (meta->block_tile_y * TILE_H) + 24, 
                                BALL_WIDTH, BALL_HEIGHT);

        // background_restore_world_coords((meta->block_tile_x) * TILE_W,
        //   (meta->block_tile_y * TILE_H)+24, BALL_WIDTH, BALL_HEIGHT);

        bounces = bounceType;
    }

    return bounces;
}

BlockMeta *get_metaData_at(i16 wx, i16 wy)
{
    BlockMeta *meta;
    i16 tx, ty;
    i16 mx, my;

    // tile map x is the world x/2 for 2/4 tiles, the blocks map is the
    // same width as the play area and located at x = 0, so no adjustment.
    tx = (wx / 2);

    // tile map y is the world y/4 for 2/4 tiles, it is also offset
    // down the screen 6 tiles,so we need to adjust for that
    ty = ((wy) / 4) - 4;

    // blocks are 2x2 tiles so we divide out to get the index of the tile
    // in the meta data array
    mx = tx / 2;
    my = ty / 2;

    // we test wy + 6 and wx + 3, these can be outside the map when the
    // ball is in the bottom or right most tiles
    if ((mx >= BLOCKS_MAP_W / 2) || (my >= BLOCKS_MAP_H / 2))
    {
        return BOUNCE_NONE;
    }

    meta = &block_meta[mx][my];
    if (meta->is_active)
    {
        return meta;
    }
    return NULL;
}

void draw_current_blocks()
{
    u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, W_2_S_X(0),
                                  BRICKS_MAP_PIXEL_TOP_SCR);
    for (u8 y = 0; y < BLOCKS_MAP_H / 2; y++)
    {
        for (u8 x = 0; x < BLOCKS_MAP_W / 2; x++)
        {
            BlockMeta *meta = &block_meta[x][y];

            if (meta->is_active)
            {
                cpct_etm_drawTileBox2x4(x * 2, y * 2, 2, 2, BLOCKS_MAP_W, pvmem,
                                        current_level->blocks_tilemap);
            }
        }
    }
}

//
// extract from the tilemap the block definitions
//
void map_blocks_to_meta()
{
    blocks_remaining = 0;
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
                plant_tile_meta(x, y, STEEL_BLOCK, 
                    current_level->steel_score, 
                    current_level->steel_hits_to_destroy);
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
    if (hits_to_destroy != INDESTRUCTABLE) {
        blocks_remaining += 1;
    }

    block_meta[map_x / 2][map_y / 2].is_active = 1;
    block_meta[map_x / 2][map_y / 2].score = score;
    block_meta[map_x / 2][map_y / 2].remaining_hits = hits_to_destroy;
    block_meta[map_x / 2][map_y / 2].type = tile_type;
    block_meta[map_x / 2][map_y / 2].block_tile_x = map_x;
    block_meta[map_x / 2][map_y / 2].block_tile_y = map_y;
}