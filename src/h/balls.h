#ifndef _BALL_H
#define _BALL_H

#include <types.h>

#define BALL_WIDTH  3
#define BALL_HEIGHT  6

#define MAX_BALLS 3

typedef struct
{
    u8  active;      // is this ball being rendered?
    i16 x;           // current screen byte X
    i16 y;           // current screen row/pixel Y (has to be signed and able to handle - > 200)

    i16 prev_x;      // the previous screen byte X used to erase the background
    i16 prev_y;      // the previous screen row/pixel Y used to erase the background

    u8  background[BALL_WIDTH * BALL_HEIGHT]; // background for erasing the sprite  

    i16 dx;          // the balls byte delta x [-2 .. 2 and != 0]
    i16 dy;          // the balls row delta y [-4 .. 4 and != 0]

} Ball;

extern void balls_initialize();
extern void balls_update();
extern void balls_restore_background();
       
extern void balls_draw();

extern Ball * balls_get_first_active();

extern u8 serving;

#endif
