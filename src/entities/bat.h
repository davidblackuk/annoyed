#ifndef _BAT_H
#define _BAT_H

#include <types.h>


extern void bat_initialize();
extern void bat_update();
extern void bat_restore_background();
extern void bat_draw();


extern u8 batY;
extern u8 batX; 
extern u8 batW; 

#endif
