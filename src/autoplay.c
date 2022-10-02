

#include "h/bat.h"
#include "h/balls.h"
#include "h/keys.h"
#include "h/globals.h""




void auto_initialize() {

}

void auto_update() {

    Ball* ball = balls_get_first_active();

    keys_resetAllKeys();

    if (ball != NULL) {
        if (serving) {
            key_serve_is_pressed = 1;
        } else if (batX < ball->x) {
            key_right_is_pressed = 1;
        } else if (batX > ball->x) {
            key_left_is_pressed = 1;
        }
    }

}
