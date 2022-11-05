#include "types.h"
#include "h/strings.h"

u8 strlen2(char *str) {
    u8 res = 0;
    while (*str) {
        res++;
        str++;
    }
    return res;
}