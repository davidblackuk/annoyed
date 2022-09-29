
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



$(eval $(call TMX2C,assets/level-01.tmx,g_tilemap_l00,src/map))

