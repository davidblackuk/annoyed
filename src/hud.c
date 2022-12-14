
#include "h/globals.h"
#include "sprites/font.h"
#include <types.h>
#include "sprites/life-marker.h"
#include "h/game.h"
#include "cpctelera.h"
#include "h/globals.h"
#include "h/text.h"


// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

void hud_initialize_internal(u8 is_restart);
void hud_initialize_static_text();
void hud_draw_score_with_added_last_zero(u16 score, u8 row);
void hud_draw_lives(u8 row);

u16 displayed_score;

#define HUD_LEFT 68
#define HUD_TOP 1
#define HUD_TEXT_SPACING 10


// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void hud_initialize()
{

    hud_initialize_internal(FALSE);
}

void hud_continue_from_death()
{
    hud_initialize_internal(TRUE);
}

void hud_update()
{
    if (current_score > displayed_score) {
        displayed_score++;
    }
}

void hud_restore_background()
{
}

void hud_draw()
{
     hud_draw_score_with_added_last_zero(displayed_score, HUD_TOP + HUD_TEXT_SPACING);
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

void hud_initialize_internal(u8 is_restart)
{
    u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8;

    displayed_score = current_score;

    hud_initialize_static_text();
    hud_draw_score_with_added_last_zero(current_score, HUD_TOP + HUD_TEXT_SPACING);

    hud_draw_score_with_added_last_zero(high_score, HUD_TOP + (HUD_TEXT_SPACING * 5));

    for (u8 i = 0; i < lives_left; i++)
    {
        u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
        u8 y = initial_y + ((i / 2) * 8);

        u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
        cpct_drawSprite(sp_life, pvmem, SP_LIFE_W, SP_LIFE_H);
    }
}

void hud_initialize_static_text()
{
    text_write_string(HUD_LEFT + 1, 1, "SCORE");

    text_write_string(HUD_LEFT + 2, 1 + (3 * HUD_TEXT_SPACING), "HIGH");
    text_write_string(HUD_LEFT + 1, 1 + (4 * HUD_TEXT_SPACING), "SCORE");

    text_write_string(HUD_LEFT + 1, 1 + (7 * HUD_TEXT_SPACING), "LEVEL");

    hud_draw_lives(1 + (8 * HUD_TEXT_SPACING));
}

/// @brief Draw a score 1 to 65535 as 10 to 655250
/// @param score the score divided by 10
void hud_draw_score_with_added_last_zero(u16 score, u8 row)
{
    u8 i;
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 80 - 2, row);

    // draw the post fix constant zero
    cpct_drawSprite(sp_font_00, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);

    for (i = 0; i < 5; i++)
    {
        u8 digit = (score % 10);
        // cpct_drawCharM0((void *)(pv - 4 * i), digit);
        cpct_drawSprite(digits[digit], (svmem - (2 * (i + 1))), SP_FONT_CHAR_W, SP_FONT_CHAR_H);
        score /= 10;
    }
}

/// @brief Draw the number of lines to the screen (01..99)
///  @param score the score divided by 10
void hud_draw_lives(u8 row)
{
    u8 num = current_level_num + 1;
    u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 74, row);

    u8 digit = (num % 10);
    cpct_drawSprite(digits[digit], svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);

    digit = ((num / 10) % 10);
    cpct_drawSprite(digits[digit], svmem - 2, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
}
