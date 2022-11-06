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
                             11 	.globl _cpct_isAnyKeyPressed_f
                             12 	.globl _cpct_isKeyPressed
                             13 	.globl _cpct_scanKeyboard_f
                             14 	.globl _key_pause_is_pressed
                             15 	.globl _key_any_is_pressed
                             16 	.globl _key_auto_is_pressed
                             17 	.globl _key_serve_is_pressed
                             18 	.globl _key_right_is_pressed
                             19 	.globl _key_left_is_pressed
                             20 	.globl _keys_initialize
                             21 	.globl _keys_resetAllKeys
                             22 	.globl _keys_update
                             23 ;--------------------------------------------------------
                             24 ; special function registers
                             25 ;--------------------------------------------------------
                             26 ;--------------------------------------------------------
                             27 ; ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DATA
   9367                      30 _key_left_is_pressed::
   9367                      31 	.ds 1
   9368                      32 _key_right_is_pressed::
   9368                      33 	.ds 1
   9369                      34 _key_serve_is_pressed::
   9369                      35 	.ds 1
   936A                      36 _key_auto_is_pressed::
   936A                      37 	.ds 1
   936B                      38 _key_any_is_pressed::
   936B                      39 	.ds 1
   936C                      40 _key_pause_is_pressed::
   936C                      41 	.ds 1
                             42 ;--------------------------------------------------------
                             43 ; ram data
                             44 ;--------------------------------------------------------
                             45 	.area _INITIALIZED
                             46 ;--------------------------------------------------------
                             47 ; absolute external ram data
                             48 ;--------------------------------------------------------
                             49 	.area _DABS (ABS)
                             50 ;--------------------------------------------------------
                             51 ; global & static initialisations
                             52 ;--------------------------------------------------------
                             53 	.area _HOME
                             54 	.area _GSINIT
                             55 	.area _GSFINAL
                             56 	.area _GSINIT
                             57 ;--------------------------------------------------------
                             58 ; Home
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _HOME
                             62 ;--------------------------------------------------------
                             63 ; code
                             64 ;--------------------------------------------------------
                             65 	.area _CODE
                             66 ;src/keys.c:21: void keys_initialize()
                             67 ;	---------------------------------
                             68 ; Function keys_initialize
                             69 ; ---------------------------------
   84A8                      70 _keys_initialize::
                             71 ;src/keys.c:23: keys_resetAllKeys();
   84A8 C3 AB 84      [10]   72 	jp  _keys_resetAllKeys
                             73 ;src/keys.c:26: void keys_resetAllKeys()
                             74 ;	---------------------------------
                             75 ; Function keys_resetAllKeys
                             76 ; ---------------------------------
   84AB                      77 _keys_resetAllKeys::
                             78 ;src/keys.c:28: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   84AB 21 69 93      [10]   79 	ld	hl,#_key_serve_is_pressed + 0
   84AE 36 00         [10]   80 	ld	(hl), #0x00
   84B0 21 68 93      [10]   81 	ld	hl,#_key_right_is_pressed + 0
   84B3 36 00         [10]   82 	ld	(hl), #0x00
   84B5 21 67 93      [10]   83 	ld	hl,#_key_left_is_pressed + 0
   84B8 36 00         [10]   84 	ld	(hl), #0x00
                             85 ;src/keys.c:29: key_auto_is_pressed = key_any_is_pressed = 0;
   84BA 21 6B 93      [10]   86 	ld	hl,#_key_any_is_pressed + 0
   84BD 36 00         [10]   87 	ld	(hl), #0x00
   84BF 21 6A 93      [10]   88 	ld	hl,#_key_auto_is_pressed + 0
   84C2 36 00         [10]   89 	ld	(hl), #0x00
   84C4 C9            [10]   90 	ret
                             91 ;src/keys.c:33: void keys_update()
                             92 ;	---------------------------------
                             93 ; Function keys_update
                             94 ; ---------------------------------
   84C5                      95 _keys_update::
                             96 ;src/keys.c:35: cpct_scanKeyboard_f();
   84C5 CD 1E 8A      [17]   97 	call	_cpct_scanKeyboard_f
                             98 ;src/keys.c:36: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   84C8 21 01 01      [10]   99 	ld	hl, #0x0101
   84CB CD 12 8A      [17]  100 	call	_cpct_isKeyPressed
   84CE FD 21 67 93   [14]  101 	ld	iy, #_key_left_is_pressed
   84D2 FD 75 00      [19]  102 	ld	0 (iy), l
                            103 ;src/keys.c:37: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   84D5 21 08 20      [10]  104 	ld	hl, #0x2008
   84D8 CD 12 8A      [17]  105 	call	_cpct_isKeyPressed
   84DB 7D            [ 4]  106 	ld	a, l
   84DC FD 21 67 93   [14]  107 	ld	iy, #_key_left_is_pressed
   84E0 FD B6 00      [19]  108 	or	a, 0 (iy)
   84E3 FD 77 00      [19]  109 	ld	0 (iy), a
                            110 ;src/keys.c:39: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   84E6 21 00 02      [10]  111 	ld	hl, #0x0200
   84E9 CD 12 8A      [17]  112 	call	_cpct_isKeyPressed
   84EC FD 21 68 93   [14]  113 	ld	iy, #_key_right_is_pressed
   84F0 FD 75 00      [19]  114 	ld	0 (iy), l
                            115 ;src/keys.c:40: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   84F3 21 07 20      [10]  116 	ld	hl, #0x2007
   84F6 CD 12 8A      [17]  117 	call	_cpct_isKeyPressed
   84F9 7D            [ 4]  118 	ld	a, l
   84FA FD 21 68 93   [14]  119 	ld	iy, #_key_right_is_pressed
   84FE FD B6 00      [19]  120 	or	a, 0 (iy)
   8501 FD 77 00      [19]  121 	ld	0 (iy), a
                            122 ;src/keys.c:42: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   8504 21 00 01      [10]  123 	ld	hl, #0x0100
   8507 CD 12 8A      [17]  124 	call	_cpct_isKeyPressed
   850A FD 21 69 93   [14]  125 	ld	iy, #_key_serve_is_pressed
   850E FD 75 00      [19]  126 	ld	0 (iy), l
                            127 ;src/keys.c:43: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   8511 21 07 08      [10]  128 	ld	hl, #0x0807
   8514 CD 12 8A      [17]  129 	call	_cpct_isKeyPressed
   8517 7D            [ 4]  130 	ld	a, l
   8518 FD 21 69 93   [14]  131 	ld	iy, #_key_serve_is_pressed
   851C FD B6 00      [19]  132 	or	a, 0 (iy)
   851F FD 77 00      [19]  133 	ld	0 (iy), a
                            134 ;src/keys.c:45: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   8522 21 04 01      [10]  135 	ld	hl, #0x0104
   8525 CD 12 8A      [17]  136 	call	_cpct_isKeyPressed
   8528 FD 21 6A 93   [14]  137 	ld	iy, #_key_auto_is_pressed
   852C FD 75 00      [19]  138 	ld	0 (iy), l
                            139 ;src/keys.c:46: key_pause_is_pressed = cpct_isKeyPressed(Key_1);
   852F 21 08 01      [10]  140 	ld	hl, #0x0108
   8532 CD 12 8A      [17]  141 	call	_cpct_isKeyPressed
   8535 FD 21 6C 93   [14]  142 	ld	iy, #_key_pause_is_pressed
   8539 FD 75 00      [19]  143 	ld	0 (iy), l
                            144 ;src/keys.c:47: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   853C CD B0 8C      [17]  145 	call	_cpct_isAnyKeyPressed_f
   853F FD 21 6B 93   [14]  146 	ld	iy, #_key_any_is_pressed
   8543 FD 75 00      [19]  147 	ld	0 (iy), l
   8546 C9            [10]  148 	ret
                            149 	.area _CODE
                            150 	.area _INITIALIZER
                            151 	.area _CABS (ABS)
