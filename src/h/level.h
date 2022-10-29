#ifndef _LEVEL_H
#define _LEVEL_H

#include "h/globals.h"

/// @brief Initialize the level from scratch with a full set of blocks
extern void level_initialize();

/// @brief reset the level to serve mode and continue after a life was lost
extern void level_continue_from_death();

/// @brief render the level for a stage
extern void level_draw();

/// @brief update the level and return the current status
/// @return the scene state (continue, life lost etc)
extern SceneState level_update();



#endif
