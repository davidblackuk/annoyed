

#include "h/bat.h"
#include "h/balls.h"
#include "h/keys.h"
#include "h/globals.h""
#include "sprites/ball.h"
#include "h/debug.h"
u8 is_controling;

void auto_initialize() {
    is_controling = 0;
}

void auto_update() {

   
    if (key_auto_is_pressed) {
        is_controling = is_controling ? 0 : 1;
    }

    if (is_controling) {
        Ball* ball = balls_get_first_active();

        keys_resetAllKeys();

        if (ball != NULL) {
            if (serving) {
                key_serve_is_pressed = 1;
            } else if (batX < (ball->x + (SP_BALL_W / 2))) {
                key_right_is_pressed = 1;
            } else if (batX > (ball->x + (SP_BALL_W / 2))) {
                key_left_is_pressed = 1;
            }
        }
    }
}
