

#include <cpctelera.h>
#include <map/tiles.h>               // Tile declarations      (file generated after processing img/tiles.png)
#include "h/balls.h"
#include "h/background.h"
#include "h/globals.h"
u8 *pvmem;

void background_initialize()
{
    // address in video memory to render our tile map.
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);

    cpct_etm_setTileset2x4(g_tileset);

    // TODO: Should extract tile map width and height into seperate constants
    cpct_etm_drawTilemap2x4_f(BACKGROUND_TILMAP_W, BACKGROUND_TILMAP_H, pvmem, current_level->background_tilemap);    
}

BounceHits background_bounce_ball(i16 at_wx, i16 at_wy) {
    
    BounceHits bounces = at_wx < 0 ? BOUNCE_X : 0;
    
    bounces |= (at_wx + BALL_WIDTH)  > PLAY_AREA_WIDTH ? BOUNCE_X : BOUNCE_NONE;
    
    bounces |= (at_wy < 0) ? BOUNCE_Y : BOUNCE_NONE;
    
    return bounces;
}

void background_restore_world_coords(i16 wx, i16 wy, u8 width, u8 height) {
    
    // the world coordinates are 0 based at the top left of the play area
    // when restoring the background we paint the tilemap who's origin is
    // to the left and top of the play area: two tiles left and two above

    u8 tileX =  (wx / 2) + 2;
    u8 tileY = (wy / 4) + 2;
    u8 tileW = width / 2;
    u8 tileH = height / 4;

    // if the rectangle to redraw spans 2 tiles in height, increment the height
    if (height % 4 > 0)
    {
        tileH++;
    }

    // if the rectangle to redraw spans 2 tiles in width, increment the width
    if (width % 2 > 0)
    {
        tileW++;
    }

    // if we are on an odd pixel, increment the width as 2 pixels per byte
    if (wx & 1 == 1)
    {
        tileW += 1;
    }

    cpct_etm_drawTileBox2x4(tileX, tileY, tileW, tileH, BACKGROUND_TILMAP_W, pvmem, current_level->background_tilemap);
 
}

void background_debug_box_wc(i16 wx, i16 wy, u8 width, u8 height) {
    u8 *pvm;       
    // the world coordinates are 0 based at the top left of the play area
    // when restoring the background we paint the tilemap who's origin is
    // to the left and top of the play area: two tiles left and two above

    u8 tileX =  (wx / 2) + 2;
    u8 tileY = (wy / 4) + 2;
    u8 tileW = width / 2;
    u8 tileH = height / 4;

    // if the rectangle to redraw spans 2 tiles in height, increment the height
    if (height % 4 > 0)
    {
        tileH++;
    }

    // if the rectangle to redraw spans 2 tiles in width, increment the width
    if (width % 2 > 0)
    {
        tileW++;
    }

    // if we are on an odd pixel, increment the width as 2 pixels per byte
    if (wx & 1 == 1)
    {
        tileW += 1;
    }

    pvm = cpct_getScreenPtr(CPCT_VMEM_START, (tileX * TILE_W) + (4*TILE_W),
     tileY * TILE_H );

    cpct_drawSolidBox(pvm, 255, tileW * TILE_W , tileH + TILE_H );


    dbg_displayNumber(1, tileX);
    dbg_displayNumber(2, tileY);
}