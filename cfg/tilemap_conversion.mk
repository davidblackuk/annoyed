
##
## NEW MACROS
##

# Default values
#$(eval $(call TMX2DATA, SET_ASMVARPREFIX, yes       ))   { yes, no      }
#$(eval $(call TMX2DATA, SET_USEMACROS   , yes       ))   { yes, no      }
#$(eval $(call TMX2DATA, SET_OUTPUTS     , h c       ))   { bin hs h s c }
#$(eval $(call TMX2DATA, SET_BASE        , dec       ))   { dec hex bin }
#$(eval $(call TMX2DATA, SET_BITSPERITEM , 8         ))   { 1, 2, 4, 6, 8 }
#$(eval $(call TMX2DATA, SET_FOLDER      , src/      )) 
#$(eval $(call TMX2DATA, SET_EXTRAPAR    ,           ))	
# Conversion 
#$(eval $(call TMX2DATA, CONVERT, tmxfile, array )) 



$(eval $(call TMX2C,assets/level-01-background.tmx,g_tilemap_l01_background,src/map))
$(eval $(call TMX2C,assets/level-01-blocks.tmx,g_tilemap_l01_blocks,src/map))

$(eval $(call TMX2C,assets/level-02-background.tmx,g_tilemap_l02_background,src/map))
$(eval $(call TMX2C,assets/level-02-blocks.tmx,g_tilemap_l02_blocks,src/map))
