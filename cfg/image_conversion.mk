
##
## NEW MACROS
##

# DEFINE PALETTE
# 16-colours mode 0 palette used in this example. This values are 
# firmware color values. You may consult this colour values at 
# http://lronaldo.github.io/cpctelera/files/video/cpct_setPalette-asm.html
#  0: Black           1: Blue              2: Bright Blue      3: Red
#  5: Mauve           6: Bright Red        9: Green           11: Sky Blue
# 15: Orange         18: Bright Green     19: Sea Green       20: Bright Cyan
# 21: Lime           22: Pastel Green     24: Bright Yellow   26: Bright White

PALETTE=1 0 2 3 6 9 11 12 13 15 16 18 20 24 25 26

## Default values
#$(eval $(call IMG2SP, SET_MODE        , 0                  ))  { 0, 1, 2 }
#$(eval $(call IMG2SP, SET_MASK        , none               ))  { interlaced, none }
#$(eval $(call IMG2SP, SET_FOLDER      , src/               ))
#$(eval $(call IMG2SP, SET_EXTRAPAR    ,                    ))
#$(eval $(call IMG2SP, SET_IMG_FORMAT  , sprites            ))	{ sprites, zgtiles, screen }
#$(eval $(call IMG2SP, SET_OUTPUT      , c                  ))  { bin, c }
#$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
#$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), g_palette ))
# width height only needed if multiple sprites in one png
#$(eval $(call IMG2SP, CONVERT         , img.png , w, h, array, palette, tileset))

$(eval $(call IMG2SP, SET_FOLDER      , src/sprites               ))
$(eval $(call IMG2SP, SET_PALETTE_FW  , $(PALETTE)         ))
$(eval $(call IMG2SP, CONVERT_PALETTE , $(PALETTE), g_palette ))

$(eval $(call IMG2SP, CONVERT         , assets/bat-left.png , 0, 0, sp_bat_left))
$(eval $(call IMG2SP, CONVERT         , assets/bat-mid.png , 0, 0, sp_bat_mid))
$(eval $(call IMG2SP, CONVERT         , assets/bat-right.png , 0, 0, sp_bat_right))
$(eval $(call IMG2SP, CONVERT         , assets/ball.png , 0, 0, sp_ball))

# CONVERT TILES:
#  Converts img/tiles.png into src/map/tiles.c & src/map/tiles.h
#
# It will split img/tiles.png into 8x8 pixel mode 0 tiles and generate an array 
# of screen pixel format values for each tile. Each array will be named using 
# prefix 'g_' followed by the name of the file 'tiles' and a suffix '_XX' with
# the number of the tile (For instance, g_tiles_00, g_tiles_01...). Conversion 
# will use previously defined $(PALETTE) to generate pixel format values. 
# 'zgtiles' option generates tiles in Zig-Zag pixel order and Gray-Code row order.
# This format is optimal for drawing to screen and required all functions with
# the suffix '_g' in their names, like cpct_etm_drawTilemap4x8_ag (_a: aligned, 
# _g: Zig-Zag pixel order, Gray-Code row order). Finally, a 'g_palette' array 
# containing hardware numbers for all 16 colours will also be generated. 


# $(eval $(call IMG2SPRITES,cpc-assets/tiles.png,0,g,8,8,{$(PALETTE)},zgtiles,src/map/,))

$(eval $(call IMG2SPRITES,assets/tiles.png,0,g,4,4,{$(PALETTE)},tileset,src/map/,))
