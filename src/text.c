#include "h/text.h"
#include "cpctelera.h"
#include "sprites/font.h"
#include "h/globals.h"
#include "string.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void text_write_centered_string(u8 y, char *text)
{
    u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * SP_FONT_CHAR_W) / 2;
    text_write_string(x, y, text);
}

void text_write_string(u8 x, u8 y, char *text)
{
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    u8 index = 0;
    u8 *charsprite = 0;

    while (*text)
    {
        charsprite = 0;
        if (*text >= '0' && *text <= '9')
        {
            index = (*text) - '0';
            charsprite = sp_font_00 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
        }
        else if (*text >= 'A' && *text <= 'Z')
        {
            index = (*text) - 'A';
            charsprite = sp_font_10 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
        }
        else
        {
            switch (*text)
            {
            case ':':
                charsprite = sp_font_36;
                break;
            case '?':
                charsprite = sp_font_37;
                break;
            case ' ':
                charsprite = sp_font_38;
                break;
            case '.':
                charsprite = sp_font_39;
                break;
            case ',':
                charsprite = sp_font_40;
                break;
            }
        }

        if (charsprite != 0)
        {
            cpct_drawSprite(charsprite, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
        }

        text++;
        svmem += 2;
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
