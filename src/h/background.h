#ifndef _BACKGROUND_H
#define _BACKGROUND_H

#include "h/globals.h"
#include <map/level-01-background.h> // level - 1 map declarations (file generated after processing img/level-01.tmx)
#include "h/balls.h"

#define BACKGROUND_TILMAP_W g_tilemap_l01_background_W
#define BACKGROUND_TILMAP_H g_tilemap_l01_background_H

/// @brief Initialize the background from the level tilemap
/// This renders the initial tilemap to the screen top aligned and
/// centered in the horizontal direction.
extern void background_initialize();

/// @brief Given an x,y world coordinate pair and a byte width / pixel height
///     restore the background tiles covering that area. Obviously this will
///     over draw the area specified when it overlaps many tiles.
/// @param wx world x byte coorinate of the area to redraw
/// @param wy world y coorinate of the are to redraw
/// @param width width in bytes of the area to redraw
/// @param height height in pixels of the are to redraw
extern void background_restore_world_coords(i16 x, i16 y, u8 width, u8 height);


extern void background_restore_tiles_exact(u16 tx, u16 ty, u8 tw, u8 th);

/// @brief Test the ball coordinates and return a set of bounces (collisions) 
///        that apply to the ball.
/// @param at_wx The world X coordinate to test for collisions
/// @param at_wy  The world Y coordinate to test for collisions
/// @return A flags collection of bounces (See BOUNCE_XX in globals.c)
extern BounceHits background_bounce_ball(i16 at_wx, i16 at_w);


extern void background_debug_box_wc(i16 x, i16 y, u8 width, u8 height);



#endif
