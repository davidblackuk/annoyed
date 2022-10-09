
#include <cpctelera.h>
#include "sprites/g_palette.h"
#include "h/bat.h"
#include "h/balls.h"
#include "h/background.h"
#include "h/bricks.h"
#include "h/keys.h"
#include "h/game.h"
#include "h/autoplay.h"
#include "h/menu.h"

void play_scene(Scene *scene);

void initializeCpc()
{

   // disable firmware routines, after this all backbround processing is disabled and so, no going back to basic
   cpct_disableFirmware();

   cpct_setBorder(HW_BLACK);


   // set screen mode 0, 16 colors
   cpct_setVideoMode(0);

   cpct_setPalette((u8 *)g_palette, 16);


}

void main(void)
{

   initializeCpc();
   module_menu_initialize();
   module_game_initialize();


   while (1) {
      play_scene(&scene_menu);   
      play_scene(&scene_game);   
   }
}


void play_scene(Scene *scene) {
   SceneState state = Continue;
   
   scene->initialize();
   
   do
   {
      int w = 0;

      // wait for vsynv before rendering
      cpct_waitVSYNC();

      scene->draw();
      state = scene->update();

   } while (state == Continue);
}
