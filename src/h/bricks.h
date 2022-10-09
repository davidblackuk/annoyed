#ifndef _BRICKS_H
#define _BRICKS_H

#include <types.h>

// how far below the top of the background tile map are the bricks placed
#define BRICKS_MAP_BACKGROUND_PIXEL_OFFSET_Y 24

extern void bricks_initialize();

extern void bricks_restore(u8 x, u8 y, u8 width, u8 height);

#endif
