
#include <cpctelera.h>
#include "sprites/g_palette.h"
#include "h/game.h"
#include "h/menu.h"
#include "h/scene_game_over_win.h"
#include "h/scene_game_over_fail.h"

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

SceneState play_scene(Scene *scene);

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------

void initializeCpc()
{

   // disable firmware routines, after this all backbround processing is disabled and so, no going back to basic
   cpct_disableFirmware();

   cpct_setBorder(HW_BLACK);
   cpct_setBorder(HW_WHITE);

   // set screen mode 0, 16 colors
   cpct_setVideoMode(0);

   cpct_setPalette((u8 *)g_palette, 16);
}

void main(void)
{
   SceneState game_result;

   high_score = 1000;
   initializeCpc();
   module_menu_initialize();
   module_game_initialize();
   module_game_over_win_initialize();
   module_game_over_fail_initialize();

   while (1)
   {
      play_scene(&scene_menu);
      game_result = play_scene(&scene_game);

      if (game_result == GameOverWin)
      {
         play_scene(&scene_game_over_win);
      }
      else
      {
         play_scene(&scene_game_over_fail);
      }
   }
}

// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

SceneState play_scene(Scene *scene)
{
   SceneState state = Continue;

   scene->initialize();

   do
   {

      // wait for vsynv before rendering
      cpct_waitVSYNC();

      scene->draw();
      state = scene->update();

   } while (state == Continue);

   return state;
}
