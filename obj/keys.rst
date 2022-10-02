                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module keys
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _keys_update
                             12 	.globl _keys_resetAllKeys
                             13 	.globl _keys_initialize
                             14 	.globl _cpct_isKeyPressed
                             15 	.globl _cpct_scanKeyboard_f
                             16 	.globl _key_serve_is_pressed
                             17 	.globl _key_right_is_pressed
                             18 	.globl _key_left_is_pressed
                             19 ;--------------------------------------------------------
                             20 ; special function registers
                             21 ;--------------------------------------------------------
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _DATA
   5480                      26 _key_left_is_pressed::
   5480                      27 	.ds 1
   5481                      28 _key_right_is_pressed::
   5481                      29 	.ds 1
   5482                      30 _key_serve_is_pressed::
   5482                      31 	.ds 1
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _INITIALIZED
                             36 ;--------------------------------------------------------
                             37 ; absolute external ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DABS (ABS)
                             40 ;--------------------------------------------------------
                             41 ; global & static initialisations
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _GSINIT
                             45 	.area _GSFINAL
                             46 	.area _GSINIT
                             47 ;--------------------------------------------------------
                             48 ; Home
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _HOME
                             52 ;--------------------------------------------------------
                             53 ; code
                             54 ;--------------------------------------------------------
                             55 	.area _CODE
                             56 ;src/keys.c:9: void keys_initialize() {
                             57 ;	---------------------------------
                             58 ; Function keys_initialize
                             59 ; ---------------------------------
   4FFC                      60 _keys_initialize::
                             61 ;src/keys.c:10: keys_resetAllKeys();    
   4FFC C3 FF 4F      [10]   62 	jp  _keys_resetAllKeys
                             63 ;src/keys.c:13: void  keys_resetAllKeys() {
                             64 ;	---------------------------------
                             65 ; Function keys_resetAllKeys
                             66 ; ---------------------------------
   4FFF                      67 _keys_resetAllKeys::
                             68 ;src/keys.c:14: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   4FFF 21 82 54      [10]   69 	ld	hl,#_key_serve_is_pressed + 0
   5002 36 00         [10]   70 	ld	(hl), #0x00
   5004 21 81 54      [10]   71 	ld	hl,#_key_right_is_pressed + 0
   5007 36 00         [10]   72 	ld	(hl), #0x00
   5009 21 80 54      [10]   73 	ld	hl,#_key_left_is_pressed + 0
   500C 36 00         [10]   74 	ld	(hl), #0x00
   500E C9            [10]   75 	ret
                             76 ;src/keys.c:18: void keys_update() {
                             77 ;	---------------------------------
                             78 ; Function keys_update
                             79 ; ---------------------------------
   500F                      80 _keys_update::
                             81 ;src/keys.c:19: cpct_scanKeyboard_f();
   500F CD A7 50      [17]   82 	call	_cpct_scanKeyboard_f
                             83 ;src/keys.c:20: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   5012 21 01 01      [10]   84 	ld	hl, #0x0101
   5015 CD 9B 50      [17]   85 	call	_cpct_isKeyPressed
   5018 FD 21 80 54   [14]   86 	ld	iy, #_key_left_is_pressed
   501C FD 75 00      [19]   87 	ld	0 (iy), l
                             88 ;src/keys.c:21: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   501F 21 00 02      [10]   89 	ld	hl, #0x0200
   5022 CD 9B 50      [17]   90 	call	_cpct_isKeyPressed
   5025 FD 21 81 54   [14]   91 	ld	iy, #_key_right_is_pressed
   5029 FD 75 00      [19]   92 	ld	0 (iy), l
                             93 ;src/keys.c:22: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   502C 21 00 01      [10]   94 	ld	hl, #0x0100
   502F CD 9B 50      [17]   95 	call	_cpct_isKeyPressed
   5032 FD 21 82 54   [14]   96 	ld	iy, #_key_serve_is_pressed
   5036 FD 75 00      [19]   97 	ld	0 (iy), l
   5039 C9            [10]   98 	ret
                             99 	.area _CODE
                            100 	.area _INITIALIZER
                            101 	.area _CABS (ABS)
