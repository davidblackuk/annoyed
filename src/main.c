
#include <cpctelera.h>
#include "sprites/g_palette.h"
#include "bat/bat.h"


void initializeCpc() {
   
   // disable firmware routines, after this all backbround processing is disabled and so, no going back to basic
   cpct_disableFirmware();

   // set screen mode 0, 16 colors
   cpct_setVideoMode(0);

   cpct_setBorder(HW_BRIGHT_YELLOW);

   cpct_setPalette(g_palette, 16);
}



void main(void) {
   u8* pvmem;  // Pointer to video memory

   initializeCpc();


   resetBat();

   while (1) {

      cpct_scanKeyboard_f();

      updateBat();

      drawBat();

      cpct_waitVSYNC();
   }
}
