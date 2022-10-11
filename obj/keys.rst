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
   75C0                      29 _key_left_is_pressed::
   75C0                      30 	.ds 1
   75C1                      31 _key_right_is_pressed::
   75C1                      32 	.ds 1
   75C2                      33 _key_serve_is_pressed::
   75C2                      34 	.ds 1
   75C3                      35 _key_auto_is_pressed::
   75C3                      36 	.ds 1
   75C4                      37 _key_any_is_pressed::
   75C4                      38 	.ds 1
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
   6AFA                      67 _keys_initialize::
                             68 ;src/keys.c:13: keys_resetAllKeys();    
   6AFA C3 FD 6A      [10]   69 	jp  _keys_resetAllKeys
                             70 ;src/keys.c:16: void  keys_resetAllKeys() {
                             71 ;	---------------------------------
                             72 ; Function keys_resetAllKeys
                             73 ; ---------------------------------
   6AFD                      74 _keys_resetAllKeys::
                             75 ;src/keys.c:17: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   6AFD 21 C2 75      [10]   76 	ld	hl,#_key_serve_is_pressed + 0
   6B00 36 00         [10]   77 	ld	(hl), #0x00
   6B02 21 C1 75      [10]   78 	ld	hl,#_key_right_is_pressed + 0
   6B05 36 00         [10]   79 	ld	(hl), #0x00
   6B07 21 C0 75      [10]   80 	ld	hl,#_key_left_is_pressed + 0
   6B0A 36 00         [10]   81 	ld	(hl), #0x00
                             82 ;src/keys.c:18: key_auto_is_pressed = key_any_is_pressed = 0;
   6B0C 21 C4 75      [10]   83 	ld	hl,#_key_any_is_pressed + 0
   6B0F 36 00         [10]   84 	ld	(hl), #0x00
   6B11 21 C3 75      [10]   85 	ld	hl,#_key_auto_is_pressed + 0
   6B14 36 00         [10]   86 	ld	(hl), #0x00
   6B16 C9            [10]   87 	ret
                             88 ;src/keys.c:22: void keys_update() {
                             89 ;	---------------------------------
                             90 ; Function keys_update
                             91 ; ---------------------------------
   6B17                      92 _keys_update::
                             93 ;src/keys.c:23: cpct_scanKeyboard_f();
   6B17 CD E5 6D      [17]   94 	call	_cpct_scanKeyboard_f
                             95 ;src/keys.c:24: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   6B1A 21 01 01      [10]   96 	ld	hl, #0x0101
   6B1D CD D9 6D      [17]   97 	call	_cpct_isKeyPressed
   6B20 FD 21 C0 75   [14]   98 	ld	iy, #_key_left_is_pressed
   6B24 FD 75 00      [19]   99 	ld	0 (iy), l
                            100 ;src/keys.c:25: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   6B27 21 08 20      [10]  101 	ld	hl, #0x2008
   6B2A CD D9 6D      [17]  102 	call	_cpct_isKeyPressed
   6B2D 7D            [ 4]  103 	ld	a, l
   6B2E FD 21 C0 75   [14]  104 	ld	iy, #_key_left_is_pressed
   6B32 FD B6 00      [19]  105 	or	a, 0 (iy)
   6B35 FD 77 00      [19]  106 	ld	0 (iy), a
                            107 ;src/keys.c:27: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   6B38 21 00 02      [10]  108 	ld	hl, #0x0200
   6B3B CD D9 6D      [17]  109 	call	_cpct_isKeyPressed
   6B3E FD 21 C1 75   [14]  110 	ld	iy, #_key_right_is_pressed
   6B42 FD 75 00      [19]  111 	ld	0 (iy), l
                            112 ;src/keys.c:28: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   6B45 21 07 20      [10]  113 	ld	hl, #0x2007
   6B48 CD D9 6D      [17]  114 	call	_cpct_isKeyPressed
   6B4B 7D            [ 4]  115 	ld	a, l
   6B4C FD 21 C1 75   [14]  116 	ld	iy, #_key_right_is_pressed
   6B50 FD B6 00      [19]  117 	or	a, 0 (iy)
   6B53 FD 77 00      [19]  118 	ld	0 (iy), a
                            119 ;src/keys.c:30: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   6B56 21 00 01      [10]  120 	ld	hl, #0x0100
   6B59 CD D9 6D      [17]  121 	call	_cpct_isKeyPressed
   6B5C FD 21 C2 75   [14]  122 	ld	iy, #_key_serve_is_pressed
   6B60 FD 75 00      [19]  123 	ld	0 (iy), l
                            124 ;src/keys.c:31: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   6B63 21 07 08      [10]  125 	ld	hl, #0x0807
   6B66 CD D9 6D      [17]  126 	call	_cpct_isKeyPressed
   6B69 7D            [ 4]  127 	ld	a, l
   6B6A FD 21 C2 75   [14]  128 	ld	iy, #_key_serve_is_pressed
   6B6E FD B6 00      [19]  129 	or	a, 0 (iy)
   6B71 FD 77 00      [19]  130 	ld	0 (iy), a
                            131 ;src/keys.c:34: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   6B74 21 04 01      [10]  132 	ld	hl, #0x0104
   6B77 CD D9 6D      [17]  133 	call	_cpct_isKeyPressed
   6B7A FD 21 C3 75   [14]  134 	ld	iy, #_key_auto_is_pressed
   6B7E FD 75 00      [19]  135 	ld	0 (iy), l
                            136 ;src/keys.c:35: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   6B81 CD CF 70      [17]  137 	call	_cpct_isAnyKeyPressed_f
   6B84 FD 21 C4 75   [14]  138 	ld	iy, #_key_any_is_pressed
   6B88 FD 75 00      [19]  139 	ld	0 (iy), l
   6B8B C9            [10]  140 	ret
                            141 	.area _CODE
                            142 	.area _INITIALIZER
                            143 	.area _CABS (ABS)
