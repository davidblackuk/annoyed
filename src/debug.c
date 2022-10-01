
#include <cpctelera.h>


void drawNumber(int num)
{
    int i;
    cpct_setDrawCharM0(5, 0);
#define LASTDIGIT_VMEM 0xC000 + 75
    for (i = 0; i < 5; i++)
    {
        u8 digit = '0' + (num % 10);
        cpct_drawCharM0((void *)(LASTDIGIT_VMEM - 4 * i), digit);
        num /= 10;
    }
}
