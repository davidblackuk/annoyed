#ifndef _GLOBALS_H
#define _GLOBALS_H

#include <types.h>

// use this to establist the width etc of the tile map
#include "map/level-01-background.h"

#define NULL 0

#define WinApe_Brk __asm__(".dw #0xFFED");

// pens from our palette
#define AN_PEN_BLACK 0
#define AN_PEN_WHITE 1
#define AN_PEN_ORANGE 2
#define AN_PEN_PASTEL_CYAN 3
#define AN_PEN_PASTEL_GREEN 4
#define AN_PEN_BRIGHT_RED 5
#define AN_PEN_SKY_BLUE 6
#define AN_PEN_PASTEL_MAGENTA 7
#define AN_PEN_PASTEL_YELLOW 8
#define AN_PEN_GRAY 9
#define AN_PEN_BLUE 10
#define AN_PEN_BRIGHT_BLUE 11
#define AN_PEN_YELLOW 12


#define MODE_0_PIXELS_PER_BYTE 2
#define SCREEN_WIDTH_BYTES 80
#define SCREEN_HEIGHT_ROWS 200


// tilamap origin relative to screen
#define TILE_MAP_SCREEN_BYTE_OFFSET_X 8
#define TILE_MAP_SCREEN_PIXEL_OFFSET_Y 0

#define TILE_W 2
#define TILE_H 4


#define PLAY_AREA_LEFT_EDGE 6 * TILE_W
#define PLAY_AREA_RIGHT_EDGE (TILE_MAP_SCREEN_BYTE_OFFSET_X + (BACKGROUND_TILMAP_W * TILE_W)) - 2*TILE_W
#define PLAY_AREA_TOP_EDGE TILE_MAP_SCREEN_PIXEL_OFFSET_Y + 8

// this is the you lost a life row
#define YOUR_DEAD_PIXEL_ROW SCREEN_HEIGHT_ROWS - 6

typedef enum {
     Continue,
     SceneComplete,
     LevelCompleteFail,
     LevelCompleteSuccess
} SceneState;


// a method that requires no parameters
typedef   void (*Method)();

// a method that returns a scene state and transitions the game state
typedef   SceneState (*StateMethod)();


// A scene is a game element that represents a screen, eg the game, menu, game over scenes ets
typedef struct
{
     Method  initialize;
     Method  draw;
     StateMethod update;

} Scene;

// ---------------------------------------------------------------------
// Level definition
// ---------------------------------------------------------------------

#define NUM_LEVELS 2

typedef struct
{
    void *background_tilemap;
    void *blocks_tilemap;

} Level;

extern const Level level_definitions[NUM_LEVELS];

// A pointer to the current level
extern Level * current_level;

#endif
