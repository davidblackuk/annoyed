
#include <types.h>
#include <cpctelera.h>
#include "h/keys.h"

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

u8 key_left_is_pressed;
u8 key_right_is_pressed;
u8 key_serve_is_pressed;
u8 key_auto_is_pressed;
u8 key_any_is_pressed;
u8 key_pause_is_pressed;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void keys_initialize()
{
    keys_resetAllKeys();
}

void keys_resetAllKeys()
{
    key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
    key_auto_is_pressed = key_any_is_pressed = 0;
}

// update state for next render (this is after vsync)
void keys_update()
{
    cpct_scanKeyboard_f();
    key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
    key_left_is_pressed |= cpct_isKeyPressed(Key_A);

    key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
    key_right_is_pressed |= cpct_isKeyPressed(Key_D);

    key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
    key_serve_is_pressed |= cpct_isKeyPressed(Key_W);

    key_auto_is_pressed = cpct_isKeyPressed(Key_0);
    key_pause_is_pressed = cpct_isKeyPressed(Key_1);
    
    key_any_is_pressed = cpct_isAnyKeyPressed_f();
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
