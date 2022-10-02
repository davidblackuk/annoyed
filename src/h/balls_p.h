#ifndef _BALLS_P_H
#define _BALLS_P_H

#include "balls.h"

/*
 * forward declarations of private methods for ball updates. Only use from 
 * inside the balls module. 
*/

#include <types.h>

#define MAX_BALLS 3



// module storage
Ball balls[MAX_BALLS];

u8 serving;

void center_ball(Ball* ball);
void update_ball(Ball* ball);

#endif
