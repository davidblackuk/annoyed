

#include <cpctelera.h>
#include "bat.h"
#include "background/background.h"
#include "sprites/bat-left.h"
#include "sprites/bat-mid.h"
#include "sprites/bat-right.h"
#include <map/tiles.h>   // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level01.h> // Court map declarations (file generated after processing img/court.tmx)

#define MODE_0_PIXELS_PER_BYTE 2
#define SCREEN_WIDTH_BYTES 80
#define SCREEN_HEIGHT_ROWS 200

#define BAT_HEIGHT_PIXELS 8
#define BAT_BOTTOM_OFFSET_PIXELS 8
#define BAT_SEGMENT_WIDTH_PIXELS 4
#define BAT_SEGMENT_WIDTH_BYTES 2

#define BAT_MIN_X_BYTE_OFFSET 3*4
#define BAT_MAX_X_BYTE_OFFSET SCREEN_WIDTH_BYTES - (3*4)


u8 batY = 0;
u8 batX = 0; 
u8 oldBatX = 0; 
u8 batW = 0; 

void initializeBat() {
    batW = 8;
    batX = (SCREEN_WIDTH_BYTES- batW) / 2;
    batY = SCREEN_HEIGHT_ROWS - BAT_HEIGHT_PIXELS - BAT_BOTTOM_OFFSET_PIXELS;
    oldBatX = batX;
}


void updateBat() {
    //     batX = (batX + 1) % (SCREEN_WIDTH_BYTES - batW);
    if (cpct_isKeyPressed(Key_CursorLeft)) {
        if (batX > BAT_MIN_X_BYTE_OFFSET) {
            batX--;
        }
    } else if (cpct_isKeyPressed(Key_CursorRight)) {
        batX++;
        if (batX > BAT_MAX_X_BYTE_OFFSET - batW) {
            batX = BAT_MAX_X_BYTE_OFFSET - batW;
        }
        oldBatX = batX;
    } 
}


void drawBat()
{

    u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, batX, batY);


    // 200 - 16 = 184, 184 / 8 = 23

    restoreBackground(oldBatX, batY / 8, batW, BAT_HEIGHT_PIXELS);

    


    cpct_drawSprite(sp_bat_left, pvmem, SP_BAT_LEFT_W, SP_BAT_LEFT_H);
    cpct_drawSprite(sp_bat_mid, pvmem + BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
    cpct_drawSprite(sp_bat_mid, pvmem + 2*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_MID_W, SP_BAT_MID_H);
    cpct_drawSprite(sp_bat_right, pvmem + 3*BAT_SEGMENT_WIDTH_BYTES, SP_BAT_RIGHT_W, SP_BAT_RIGHT_H);


}