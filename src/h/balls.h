#ifndef _BALL_H
#define _BALL_H

#include <types.h>

typedef struct
{
    u8 active;      // is this ball being rendered?
    u8 x;           // current screen byte X
    u8 y;           // current screen row/pixel Y

    u8 prev_x;          // the previous screen byte X used to erase the background
    u8 prev_y;          // the previous screen row/pixel Y used to erase the background

    i8 dx;          // the balls byte delta x [-2 .. 2 and != 0]
    i8 dy;          // the balls row delta y [-4 .. 4 and != 0]

} Ball;

extern void balls_initialize();
extern void balls_update();
extern void balls_restore_background();
       
extern void balls_draw();

extern Ball * balls_get_first_active();

extern u8 serving;

#endif
