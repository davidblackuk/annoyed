#ifndef _GLOBALS_H
#define _GLOBALS_H

#define NULL 0

#define MODE_0_PIXELS_PER_BYTE 2
#define SCREEN_WIDTH_BYTES 80
#define SCREEN_HEIGHT_ROWS 200


// tilamap origin relative to screen
#define TILE_MAP_SCREEN_BYTE_OFFSET_X 8
#define TILE_MAP_SCREEN_PIXEL_OFFSET_Y 16

#define PLAY_AREA_RIGHT_EDGE SCREEN_WIDTH_BYTES - (2+(3*4))
#define PLAY_AREA_LEFT_EDGE 3*4

#define PLAY_AREA_TOP_EDGE TILE_MAP_SCREEN_PIXEL_OFFSET_Y + 8

// this is the you lost a life row
#define YOUR_DEAD_PIXEL_ROW SCREEN_HEIGHT_ROWS - 6


#endif
