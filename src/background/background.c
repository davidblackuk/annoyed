

#include <cpctelera.h>
#include <map/tiles.h>    // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01.h> // level - 1 map declarations (file generated after processing img/level-01.tmx)

u8 *pvmem;

#define TILE_MAP_SCREEN_BYTE_OFFSET_X 8
#define TILE_MAP_SCREEN_PIXEL_OFFSET_y 16

void drawNumber(u8 num) {
    u8 i;
    cpct_setDrawCharM0(5, 0);
    #define LASTDIGIT_VMEM  0xC000 + 75
      for(i=0; i<5; i++) {
         u8 digit = '0' + (num % 10);
         cpct_drawCharM0((void*)(LASTDIGIT_VMEM - 4*i), digit);
         num /= 10;
      }
}

void initializeBackground()
{
    // address in video memory to render our tile map.
    pvmem = cpct_getScreenPtr(CPCT_VMEM_START, TILE_MAP_SCREEN_BYTE_OFFSET_X, TILE_MAP_SCREEN_PIXEL_OFFSET_y);

    cpct_etm_setTileset2x4(g_tileset);

    // cpct_etm_drawTileBox2x4(0, 0, g_tilemap_W, g_tilemap_H, g_tilemap_W, pvmem, g_tilemap);
    cpct_etm_drawTilemap2x4_f(g_tilemap_l00_W, g_tilemap_l00_H, pvmem, g_tilemap_l00);
}

// restore a specified box of background incomming dimensions are in byte . row format
// not incomming coords are in screen coordinates, but the tilmap
// is narrower than the screen.
void restoreBackground(u8 screenX, u8 screenY, u8 bwidth, u8 pHeight)
{
   u8 tileX = (screenX - TILE_MAP_SCREEN_BYTE_OFFSET_X) / 2;
   u8 tileY = (screenY - TILE_MAP_SCREEN_PIXEL_OFFSET_y) / 4; 
cpct_etm_drawTileBox2x4(tileX, tileY, bwidth / 2, pHeight / 4, g_tilemap_l00_W, pvmem, g_tilemap_l00);
    drawNumber(tileX);
}

