#ifndef _GAME_H
#define _GAME_H

#include "h/globals.h"
#include "h/level.h"
#include "h/hud.h"

#define INITIAL_LIVES 4

extern void module_game_initialize();

extern u8 current_level_num;
extern u8 lives_left;
extern u16 current_score;
extern u16 high_score;

extern Scene scene_game;


#endif
