

#include <cpctelera.h>
#include "bat.h"
#include "background/background.h"
#include "sprites/bat-left.h"
#include "sprites/bat-mid.h"
#include "sprites/bat-right.h"
#include <map/tiles.h>   // Tile declarations      (file generated after processing img/tiles.png)

#define MODE_0_PIXELS_PER_BYTE 2
#define SCREEN_WIDTH_BYTES 80
#define SCREEN_HEIGHT_ROWS 200

#define BAT_HEIGHT_PIXELS 8
#define BAT_BOTTOM_OFFSET_PIXELS 8
#define BAT_SEGMENT_WIDTH_PIXELS 4
#define BAT_SEGMENT_WIDTH_BYTES 2

#define BAT_MIN_X_BYTE_OFFSET 3*4
#define BAT_MAX_X_BYTE_OFFSET SCREEN_WIDTH_BYTES - (2+(3*4))


u8 batY = 0;
u8 batX = 0; 
u8 oldBatX = 0; 
u8 batW = 0; 

void bat_initialize() {
    batW = 8;
    batX = (SCREEN_WIDTH_BYTES- batW) / 2;
    batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
    oldBatX = batX;
}


void bat_update() {
    if (cpct_isKeyPressed(Key_CursorLeft)) {
        if (batX > BAT_MIN_X_BYTE_OFFSET) {
            oldBatX = batX;
            batX--;
        }
    } else if (cpct_isKeyPressed(Key_CursorRight)) {
        if (batX < BAT_MAX_X_BYTE_OFFSET - batW) {
            oldBatX = batX;
            batX++;
        }
    } 
}

void bat_restore_background() {
    restoreBackground(oldBatX, batY, batW, BAT_HEIGHT_PIXELS);
}

void bat_draw()
{
     u8 *svmem;

    svmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);

    cpct_drawSprite(sp_bat_left, svmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
    cpct_drawSprite(sp_bat_mid, svmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
    cpct_drawSprite(sp_bat_mid, svmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
    cpct_drawSprite(sp_bat_right, svmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);


}