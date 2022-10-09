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
                             14 	.globl _key_any_is_pressed
                             15 	.globl _key_auto_is_pressed
                             16 	.globl _key_serve_is_pressed
                             17 	.globl _key_right_is_pressed
                             18 	.globl _key_left_is_pressed
                             19 	.globl _keys_initialize
                             20 	.globl _keys_resetAllKeys
                             21 	.globl _keys_update
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
   6D94                      29 _key_left_is_pressed::
   6D94                      30 	.ds 1
   6D95                      31 _key_right_is_pressed::
   6D95                      32 	.ds 1
   6D96                      33 _key_serve_is_pressed::
   6D96                      34 	.ds 1
   6D97                      35 _key_auto_is_pressed::
   6D97                      36 	.ds 1
   6D98                      37 _key_any_is_pressed::
   6D98                      38 	.ds 1
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _INITIALIZED
                             43 ;--------------------------------------------------------
                             44 ; absolute external ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DABS (ABS)
                             47 ;--------------------------------------------------------
                             48 ; global & static initialisations
                             49 ;--------------------------------------------------------
                             50 	.area _HOME
                             51 	.area _GSINIT
                             52 	.area _GSFINAL
                             53 	.area _GSINIT
                             54 ;--------------------------------------------------------
                             55 ; Home
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _HOME
                             59 ;--------------------------------------------------------
                             60 ; code
                             61 ;--------------------------------------------------------
                             62 	.area _CODE
                             63 ;src/keys.c:12: void keys_initialize() {
                             64 ;	---------------------------------
                             65 ; Function keys_initialize
                             66 ; ---------------------------------
   6655                      67 _keys_initialize::
                             68 ;src/keys.c:13: keys_resetAllKeys();    
   6655 C3 58 66      [10]   69 	jp  _keys_resetAllKeys
                             70 ;src/keys.c:16: void  keys_resetAllKeys() {
                             71 ;	---------------------------------
                             72 ; Function keys_resetAllKeys
                             73 ; ---------------------------------
   6658                      74 _keys_resetAllKeys::
                             75 ;src/keys.c:17: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   6658 21 96 6D      [10]   76 	ld	hl,#_key_serve_is_pressed + 0
   665B 36 00         [10]   77 	ld	(hl), #0x00
   665D 21 95 6D      [10]   78 	ld	hl,#_key_right_is_pressed + 0
   6660 36 00         [10]   79 	ld	(hl), #0x00
   6662 21 94 6D      [10]   80 	ld	hl,#_key_left_is_pressed + 0
   6665 36 00         [10]   81 	ld	(hl), #0x00
                             82 ;src/keys.c:18: key_auto_is_pressed = key_any_is_pressed = 0;
   6667 21 98 6D      [10]   83 	ld	hl,#_key_any_is_pressed + 0
   666A 36 00         [10]   84 	ld	(hl), #0x00
   666C 21 97 6D      [10]   85 	ld	hl,#_key_auto_is_pressed + 0
   666F 36 00         [10]   86 	ld	(hl), #0x00
   6671 C9            [10]   87 	ret
                             88 ;src/keys.c:22: void keys_update() {
                             89 ;	---------------------------------
                             90 ; Function keys_update
                             91 ; ---------------------------------
   6672                      92 _keys_update::
                             93 ;src/keys.c:23: cpct_scanKeyboard_f();
   6672 CD 3C 69      [17]   94 	call	_cpct_scanKeyboard_f
                             95 ;src/keys.c:24: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   6675 21 01 01      [10]   96 	ld	hl, #0x0101
   6678 CD 30 69      [17]   97 	call	_cpct_isKeyPressed
   667B FD 21 94 6D   [14]   98 	ld	iy, #_key_left_is_pressed
   667F FD 75 00      [19]   99 	ld	0 (iy), l
                            100 ;src/keys.c:25: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   6682 21 08 20      [10]  101 	ld	hl, #0x2008
   6685 CD 30 69      [17]  102 	call	_cpct_isKeyPressed
   6688 7D            [ 4]  103 	ld	a, l
   6689 FD 21 94 6D   [14]  104 	ld	iy, #_key_left_is_pressed
   668D FD B6 00      [19]  105 	or	a, 0 (iy)
   6690 FD 77 00      [19]  106 	ld	0 (iy), a
                            107 ;src/keys.c:27: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   6693 21 00 02      [10]  108 	ld	hl, #0x0200
   6696 CD 30 69      [17]  109 	call	_cpct_isKeyPressed
   6699 FD 21 95 6D   [14]  110 	ld	iy, #_key_right_is_pressed
   669D FD 75 00      [19]  111 	ld	0 (iy), l
                            112 ;src/keys.c:28: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   66A0 21 07 20      [10]  113 	ld	hl, #0x2007
   66A3 CD 30 69      [17]  114 	call	_cpct_isKeyPressed
   66A6 7D            [ 4]  115 	ld	a, l
   66A7 FD 21 95 6D   [14]  116 	ld	iy, #_key_right_is_pressed
   66AB FD B6 00      [19]  117 	or	a, 0 (iy)
   66AE FD 77 00      [19]  118 	ld	0 (iy), a
                            119 ;src/keys.c:30: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   66B1 21 00 01      [10]  120 	ld	hl, #0x0100
   66B4 CD 30 69      [17]  121 	call	_cpct_isKeyPressed
   66B7 FD 21 96 6D   [14]  122 	ld	iy, #_key_serve_is_pressed
   66BB FD 75 00      [19]  123 	ld	0 (iy), l
                            124 ;src/keys.c:31: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   66BE 21 07 08      [10]  125 	ld	hl, #0x0807
   66C1 CD 30 69      [17]  126 	call	_cpct_isKeyPressed
   66C4 7D            [ 4]  127 	ld	a, l
   66C5 FD 21 96 6D   [14]  128 	ld	iy, #_key_serve_is_pressed
   66C9 FD B6 00      [19]  129 	or	a, 0 (iy)
   66CC FD 77 00      [19]  130 	ld	0 (iy), a
                            131 ;src/keys.c:34: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   66CF 21 04 01      [10]  132 	ld	hl, #0x0104
   66D2 CD 30 69      [17]  133 	call	_cpct_isKeyPressed
   66D5 FD 21 97 6D   [14]  134 	ld	iy, #_key_auto_is_pressed
   66D9 FD 75 00      [19]  135 	ld	0 (iy), l
                            136 ;src/keys.c:35: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   66DC CD 26 6C      [17]  137 	call	_cpct_isAnyKeyPressed_f
   66DF FD 21 98 6D   [14]  138 	ld	iy, #_key_any_is_pressed
   66E3 FD 75 00      [19]  139 	ld	0 (iy), l
   66E6 C9            [10]  140 	ret
                            141 	.area _CODE
                            142 	.area _INITIALIZER
                            143 	.area _CABS (ABS)
