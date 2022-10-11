#ifndef _BACKGROUND_H
#define _BACKGROUND_H

#include "h/globals.h"
#include <map/level-01-background.h> // level - 1 map declarations (file generated after processing img/level-01.tmx)


#define BACKGROUND_TILMAP_W g_tilemap_l01_background_W
#define BACKGROUND_TILMAP_H g_tilemap_l01_background_H

extern void background_initialize();

extern void background_restore(u8 x, u8 y, u8 width, u8 height);

extern void background_restore_world_coords(u8 x, u8 y, u8 width, u8 height);


#endif
