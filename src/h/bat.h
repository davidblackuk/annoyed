#ifndef _BAT_H
#define _BAT_H

#include "h/globals.h"
#include "h/balls.h"

extern void bat_initialize();
extern void bat_update();
extern void bat_restore_background();
extern void bat_draw();
extern BounceHits bat_bounce_ball(Ball * ball, i16 at_x, i16 at_y);

extern u8 batY;
extern u8 batX; 
extern u8 batW; 

#endif
