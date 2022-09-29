
#include <cpctelera.h>
#include "sprites/g_palette.h"
#include "bat/bat.h"
#include "background/background.h"


#include <map/tiles.h>   // Tile declarations      (file generated after processing img/tiles.png)
#include <map/level-01.h> // Court map declarations (file generated after processing img/court.tmx)

#include "sprites/ball.h"

void initializeCpc() {
   
   // disable firmware routines, after this all backbround processing is disabled and so, no going back to basic
   cpct_disableFirmware();

   // set screen mode 0, 16 colors
   cpct_setVideoMode(0);

   cpct_setBorder(HW_BRIGHT_YELLOW);

   cpct_setPalette(g_palette, 16);
}


void main(void) {

   initializeCpc();

   initializeBackground();
   initializeBat();

   while (1) {



      cpct_waitVSYNC();
      
      drawBat();

      cpct_scanKeyboard_f();
      updateBat();

      {
         u8* svmem = cpct_getScreenPtr(CPCT_VMEM_START, 100, 150);
         cpct_drawSprite(sp_ball, svmem ,SP_BALL_W, SP_BALL_H);
      }
   }
}


