
#include <cpctelera.h>
#include "h/globals.h"
#include "h/text.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

// TODO - move to functions in text.c
void dbg_write_number(u8 x, u8 y, u16 num)
{
    text_write_number(x, y, num);
}


void dbg_write_string(u8 x, u8 y, char * text) {
    text_write_string(x, y, text);
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
