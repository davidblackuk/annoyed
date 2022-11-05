
#include <cpctelera.h>
#include "h/globals.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

// TODO - move to functions in text.c
void dbg_displayNumber(u8 char_row, i16 num)
{
    i16 i;
    u8 negative = 0;
    u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START, 74, char_row * 10);

    if (num < 0)
    {
        negative = 1;
        num = -num;

        cpct_setDrawCharM0(AN_PEN_BRIGHT_RED, AN_PEN_ORANGE);
    }
    else
    {
        cpct_setDrawCharM0(AN_PEN_SKY_BLUE, AN_PEN_BLUE);
    }

    for (i = 0; i < 5; i++)
    {
        u8 digit = '0' + (num % 10);
        cpct_drawCharM0((void *)(pv - 4 * i), digit);
        num /= 10;
    }
    if (negative)
    {
        cpct_drawCharM0((void *)(pv - 20), '-');
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
