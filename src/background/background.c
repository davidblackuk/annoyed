

#include <cpctelera.h>
#include <map/tiles.h>    // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01.h> // level - 1 map declarations (file generated after processing img/level-01.tmx)

u8 *pvmem;

#define TILE_MAP_SCREEN_BYTE_OFFSET_X 8
#define TILE_MAP_SCREEN_PIXEL_OFFSET_y 16



void initializeBackground()
{
    // address in video memory to render our tile map.
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_y);

    cpct_etm_setTileset2x4(g_tileset);

    // cpct_etm_drawTileBox2x4(0, 0, g_tilemap_W, g_tilemap_H, g_tilemap_W, pvmem, g_tilemap);
    cpct_etm_drawTilemap2x4_f(g_tilemap_l00_W, g_tilemap_l00_H, pvmem, g_tilemap_l00);
}



void restoreBackground(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
{
    u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
    u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_y) / 4;
    u8 tileW = bwidth / 2;


    if (screenX & 1 == 1)
    {
        bwidth += 1;
    }

    cpct_etm_drawTileBox2x4(tileX, tileY, tileW , pHeight / 4, g_tilemap_l00_W, pvmem, g_tilemap_l00);
   
}
