

#include <cpctelera.h>
#include <map/tiles.h>                  // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01-background.h>    // level - 1 map declarations (file generated after processing img/level-01.tmx)
#include "h/debug.h"
#include "h/background.h"
#include "h/globals.h"
u8 *pvmem;

void background_initialize()
{

    // address in video memory to render our tile map.
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_Y);

    cpct_etm_setTileset2x4(g_tileset);

    // cpct_etm_drawTileBox2x4(0, 0, g_tilemap_W, g_tilemap_H, g_tilemap_W, pvmem, g_tilemap);
    cpct_etm_drawTilemap2x4_f(g_tilemap_l00_background_W, g_tilemap_l00_background_H, pvmem, g_tilemap_l00_background);
}



void background_restore(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
{
 
    // move this to inline once the code settles
    u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
    u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_Y) / 4;
    u8 tileW = bwidth / 2;
    u8 tileH = pHeight / 4;

    if (pHeight % 4 > 0) {
        tileH ++;
    }
    
    if (bwidth % 2 > 0) {
        tileW ++;
    }

    if (screenX & 1 == 1)
    {
        tileW += 1;
    }

    cpct_etm_drawTileBox2x4(tileX, tileY, tileW , tileH , g_tilemap_l00_background_W, pvmem, g_tilemap_l00_background);


 #ifdef DEBUG_TILE_BOX   
    svmem = cpct_getScreenPtr(CPCT_VMEM_START, 
        tileX*2 + TILE_MAP_SCREEN_BYTE_OFFSET_X, 
        tileY*4 + TILE_MAP_SCREEN_PIXEL_OFFSET_Y);
    
    cpct_drawSolidBox(svmem, 0x3F, tileW*2, tileH * 4);
#endif

}
