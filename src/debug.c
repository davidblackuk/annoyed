
#include <cpctelera.h>


void dbg_displayNumber(u8 char_row, int num)
{
    int i;
    u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START,74, char_row * 10);
    cpct_setDrawCharM0(5, 0);
    
    for (i = 0; i < 5; i++)
    {
        u8 digit = '0' + (num % 10);
        cpct_drawCharM0((void *)(pv - 4 * i), digit);
        num /= 10;
    }
}
