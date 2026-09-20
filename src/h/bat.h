#ifndef _BAT_H
#define _BAT_H

#include "h/globals.h"
#include "h/balls.h"

extern void bat_initialize();

/// @brief snapshot the bat's last-drawn position/width for this frame's
/// restore - must be called first thing in level_update(), before
/// anything that can move or resize the bat.
extern void bat_begin_frame();

extern void bat_update();
extern void bat_move_towards(i16 target_x);
extern void bat_restore_background();
extern void bat_draw();
extern BounceHits bat_bounce_ball(Ball * ball, i16 at_x, i16 at_y);

/// @brief does the bat currently overlap the given world-space rectangle?
/// used by the powerups module to detect a capsule being caught.
extern u8 bat_is_catching(i16 x, i16 y, u8 w, u8 h);

/// @brief apply/refresh the Expand power-up: grows the bat (if not already
/// expanded) and (re)starts its duration timer.
extern void bat_apply_expand();

extern u8 batY;
extern u8 batX; 
extern u8 batW; 

#endif
