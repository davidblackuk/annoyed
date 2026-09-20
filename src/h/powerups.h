#ifndef _POWERUPS_H
#define _POWERUPS_H

#include <types.h>
#include "h/globals.h"
#include "sprites/pow-green.h"
#include "h/text.h"

#define MAX_POWERUPS 3   // matches MAX_BALLS

#define POWERUP_FOOTPRINT_W SP_POW_GREEN_W   // 4 bytes wide - capsule width
#define POWERUP_FOOTPRINT_H SP_FONT_CHAR_H   // 8 rows - the letter glyph
                                              // (8 rows) is taller than the
                                              // capsule body (7 rows), so the
                                              // store/restore footprint must
                                              // cover the union of both

typedef struct
{
    u8  active;
    u8  type;       // POWERUP_EXPAND / POWERUP_DISRUPTION

    i16 x;
    i16 y;
    i16 prev_x;
    i16 prev_y;

    u8  background[POWERUP_FOOTPRINT_W * POWERUP_FOOTPRINT_H];
} Powerup;

extern void powerups_initialize();
extern void powerups_update();
extern void powerups_restore_background();
extern void powerups_store_background();
extern void powerups_draw();

/// @brief spawn a falling capsule of the given type at a block's world
/// position. Does nothing if type is POWERUP_NONE or no free capsule slot
/// is available.
extern void powerups_spawn(u8 type, i16 world_x, i16 world_y);

#endif
