
##
## NEW MACROS
##

# see
# https://www.cpcwiki.eu/index.php/CPC_Palette


# black,  Bright White, Orange, Pastel Cyan, Pastel Green, Bright red, Sky blue, Pastel Magenta, Pastel Yellow, White (grey), Blue, Bright blue, yellow, red, Pastel Blue , ???
# 000000, FFFFFF, FF8000, 80FFF, 80FF80, FF0000, 0080FF, FF80FF, FFFF80, 808080, 000080, 0000FF, 808000, 800000 8080ff FF0080
# 0 26 15 23 22 6 11 17 25 13 1 2 12 ?? ?? ??
# we have NO spares at the moment
# we use 008080 for transparent (dull green pallete no. 11)
PALETTE=0 26 15 23 22 6 11 17 25 13 1 2 12 3 14 7



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

$(eval $(call IMG2SP, CONVERT         , assets/bat-mid.png , 0, 0, sp_bat_mid))
$(eval $(call IMG2SP, CONVERT         , assets/annoyed.png , 0, 0, sp_logo))
$(eval $(call IMG2SP, CONVERT         , assets/life-marker.png , 0, 0, sp_life))

$(eval $(call IMG2SP, CONVERT         , assets/score.png , 0, 0, sp_score))
$(eval $(call IMG2SP, CONVERT         , assets/level.png , 0, 0, sp_level))
$(eval $(call IMG2SP, CONVERT         , assets/hi.png , 0, 0, sp_high))

$(eval $(call IMG2SP, CONVERT         , assets/digit_0.png , 0, 0, sp_zero))
$(eval $(call IMG2SP, CONVERT         , assets/digit_1.png , 0, 0, sp_one))
$(eval $(call IMG2SP, CONVERT         , assets/digit_2.png , 0, 0, sp_two))
$(eval $(call IMG2SP, CONVERT         , assets/digit_3.png , 0, 0, sp_three))
$(eval $(call IMG2SP, CONVERT         , assets/digit_4.png , 0, 0, sp_four))
$(eval $(call IMG2SP, CONVERT         , assets/digit_5.png , 0, 0, sp_five))
$(eval $(call IMG2SP, CONVERT         , assets/digit_6.png , 0, 0, sp_six))
$(eval $(call IMG2SP, CONVERT         , assets/digit_7.png , 0, 0, sp_seven))
$(eval $(call IMG2SP, CONVERT         , assets/digit_8.png , 0, 0, sp_eight))
$(eval $(call IMG2SP, CONVERT         , assets/digit_9.png , 0, 0, sp_nine))



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
