#include "h/bat.h"
#include "h/balls.h"
#include "h/keys.h"
#include "h/globals.h"
#include "h/debug.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

u8 is_controling;

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void auto_initialize()
{
    is_controling = 0;
}

void auto_update()
{
    u8 mid_bat_x;

    if (key_auto_is_pressed)
    {
        is_controling = is_controling ? 0 : 1;
    }

    if (is_controling)
    {
        Ball *ball = balls_get_first_active();

        keys_resetAllKeys();
        if (ball != NULL)
        {
            mid_bat_x = batX + (batW / 2);
            if (serving)
            {
                key_serve_is_pressed = 1;
            }
            else if (mid_bat_x < ball->x)
            {
                key_right_is_pressed = 1;
            }
            else if (mid_bat_x > ball->x)
            {
                key_left_is_pressed = 1;
            }
        }
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
