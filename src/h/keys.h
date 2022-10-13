#ifndef _KEYBOARD_H
#define _KEYBOARD_H

#include <types.h>

extern void keys_initialize();
extern void keys_resetAllKeys();
extern void keys_update();

extern u8 key_left_is_pressed;
extern u8 key_right_is_pressed;
extern u8 key_serve_is_pressed;
extern u8 key_any_is_pressed;
extern u8 key_pause_is_pressed;

// toggler auto play
extern u8 key_auto_is_pressed;


#endif