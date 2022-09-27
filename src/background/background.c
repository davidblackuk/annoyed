

#include <cpctelera.h>
#include <map/tiles.h>   // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level01.h> // Court map declarations (file generated after processing img/court.tmx)

u8 *pvmem;

void initializeBackground()
{
    // address in video memory to render our tile map.
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 8, 16);

    // initialze the internals for tile map rendering. our oscreen tile width and max
    // tile width are the same, g_tiles_00 is the tileset image data
    cpct_etm_setDrawTilemap4x8_ag(g_tilemap_W, g_tilemap_H, g_tilemap_W, g_tiles_00);

    // draw the complete tilemap centered in the screen, the tile map will change per level,
    // one we'll only have tile set / image
    cpct_etm_drawTilemap4x8_ag(pvmem, g_tilemap);

    cpct_etm_setTileset2x4(g_tiles_00);
}


// restore a specified box of background
void restoreBackground(u8 tx, u8 ty, u8 twidth, u8 tHeight) {

   // cpct_etm_drawTileBox2x4(tileX, tileY, 1tilesWide, 1tilesHeigh)
   cpct_etm_drawTileBox2x4(1, 1, 2, 2, g_tilemap_W, pvmem, g_tilemap);


}