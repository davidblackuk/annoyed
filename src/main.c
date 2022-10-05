
#include <cpctelera.h>
#include "sprites/g_palette.h"
#include "h/bat.h"
#include "h/balls.h"
#include "h/background.h"
#include "h/bricks.h"
#include "h/keys.h"

void initializeCpc()
{

   // disable firmware routines, after this all backbround processing is disabled and so, no going back to basic
   cpct_disableFirmware();

   // set screen mode 0, 16 colors
   cpct_setVideoMode(0);

   cpct_setBorder(HW_BRIGHT_YELLOW);

   cpct_setPalette((u8 *)g_palette, 16);
}

void main(void)
{

   initializeCpc();

   background_initialize();
   bricks_initialize();
   auto_initialize();
   keys_initialize();
   bat_initialize();
   balls_initialize();

   while (1)
   {
      int w = 0;

      // wait for vsynv before rendering
      cpct_waitVSYNC();

      // restore the background of moving items
      bat_restore_background();
      balls_restore_background();

      // draw that which must be drawn
      bat_draw();
      balls_draw();

      keys_update();
      auto_update();
      bat_update();
      balls_update();

#define DELAY_UPDATE 1

#ifdef DELAY_UPDATE
      for (int o = 0; o < 3000; o++)
      {
         w += 1;
      }
#endif
   }
}
