#include "h/text.h"
#include "cpctelera.h"
#include "sprites/font.h"
#include "h/globals.h"
#include "string.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// lookup table: digits[n] is the sprite for the character '0'+n, used by
// text_write_number to avoid a branch/switch per digit
const u8 * const digits[10] = {
    sp_font_00,
    sp_font_01,
    sp_font_02,
    sp_font_03,
    sp_font_04,
    sp_font_05,
    sp_font_06,
    sp_font_07,
    sp_font_08,
    sp_font_09,
};

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void text_write_centered_string(u8 y, char *text)
{
    // centre by width in screen bytes, not characters, since each glyph is
    // a fixed SP_FONT_CHAR_W bytes wide (see text_write_string)
    u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * SP_FONT_CHAR_W) / 2;
    text_write_string(x, y, text);
}

void text_write_string(u8 x, u8 y, char *text)
{
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
    u8 index = 0;
    const u8 *charsprite = 0;

    while (*text)
    {
        charsprite = 0;

        // the font sprite sheet is laid out as one contiguous block per
        // range (digits, then letters), so a character's sprite is found
        // by offsetting from that range's first sprite by its index within
        // the range - avoids needing 36+ named sprite pointers
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
            // punctuation isn't contiguous/offset-friendly in the sheet,
            // so these few are just mapped one at a time
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

        // any character not covered above (the font is partial - see
        // text.h) is silently skipped rather than drawn as junk/a blank box
        if (charsprite != 0)
        {
            cpct_drawSprite((void *)charsprite, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
        }

        text++;
        svmem += 2; // each glyph is 2 screen bytes (4 mode-0 pixels) wide
    }
}

void text_write_number(u8 x, u8 y, u16 number) {
    u8 i;

    // always draws exactly 5 digits, right-aligned, least-significant digit
    // first - so start 4 glyphs (10 bytes) to the right of x and walk back
    // as each digit is peeled off with % 10 / 10
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x + 10, y);

     for (i = 0; i < 5; i++)
    {
        u8 digit = (number % 10);
        cpct_drawSprite((void *)digits[digit], (svmem - (2 * (i + 1))), SP_FONT_CHAR_W, SP_FONT_CHAR_H);
        number /= 10;
    }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------
