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
   7558                      29 _key_left_is_pressed::
   7558                      30 	.ds 1
   7559                      31 _key_right_is_pressed::
   7559                      32 	.ds 1
   755A                      33 _key_serve_is_pressed::
   755A                      34 	.ds 1
   755B                      35 _key_auto_is_pressed::
   755B                      36 	.ds 1
   755C                      37 _key_any_is_pressed::
   755C                      38 	.ds 1
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
   6A92                      67 _keys_initialize::
                             68 ;src/keys.c:13: keys_resetAllKeys();    
   6A92 C3 95 6A      [10]   69 	jp  _keys_resetAllKeys
                             70 ;src/keys.c:16: void  keys_resetAllKeys() {
                             71 ;	---------------------------------
                             72 ; Function keys_resetAllKeys
                             73 ; ---------------------------------
   6A95                      74 _keys_resetAllKeys::
                             75 ;src/keys.c:17: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   6A95 21 5A 75      [10]   76 	ld	hl,#_key_serve_is_pressed + 0
   6A98 36 00         [10]   77 	ld	(hl), #0x00
   6A9A 21 59 75      [10]   78 	ld	hl,#_key_right_is_pressed + 0
   6A9D 36 00         [10]   79 	ld	(hl), #0x00
   6A9F 21 58 75      [10]   80 	ld	hl,#_key_left_is_pressed + 0
   6AA2 36 00         [10]   81 	ld	(hl), #0x00
                             82 ;src/keys.c:18: key_auto_is_pressed = key_any_is_pressed = 0;
   6AA4 21 5C 75      [10]   83 	ld	hl,#_key_any_is_pressed + 0
   6AA7 36 00         [10]   84 	ld	(hl), #0x00
   6AA9 21 5B 75      [10]   85 	ld	hl,#_key_auto_is_pressed + 0
   6AAC 36 00         [10]   86 	ld	(hl), #0x00
   6AAE C9            [10]   87 	ret
                             88 ;src/keys.c:22: void keys_update() {
                             89 ;	---------------------------------
                             90 ; Function keys_update
                             91 ; ---------------------------------
   6AAF                      92 _keys_update::
                             93 ;src/keys.c:23: cpct_scanKeyboard_f();
   6AAF CD 7D 6D      [17]   94 	call	_cpct_scanKeyboard_f
                             95 ;src/keys.c:24: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   6AB2 21 01 01      [10]   96 	ld	hl, #0x0101
   6AB5 CD 71 6D      [17]   97 	call	_cpct_isKeyPressed
   6AB8 FD 21 58 75   [14]   98 	ld	iy, #_key_left_is_pressed
   6ABC FD 75 00      [19]   99 	ld	0 (iy), l
                            100 ;src/keys.c:25: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   6ABF 21 08 20      [10]  101 	ld	hl, #0x2008
   6AC2 CD 71 6D      [17]  102 	call	_cpct_isKeyPressed
   6AC5 7D            [ 4]  103 	ld	a, l
   6AC6 FD 21 58 75   [14]  104 	ld	iy, #_key_left_is_pressed
   6ACA FD B6 00      [19]  105 	or	a, 0 (iy)
   6ACD FD 77 00      [19]  106 	ld	0 (iy), a
                            107 ;src/keys.c:27: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   6AD0 21 00 02      [10]  108 	ld	hl, #0x0200
   6AD3 CD 71 6D      [17]  109 	call	_cpct_isKeyPressed
   6AD6 FD 21 59 75   [14]  110 	ld	iy, #_key_right_is_pressed
   6ADA FD 75 00      [19]  111 	ld	0 (iy), l
                            112 ;src/keys.c:28: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   6ADD 21 07 20      [10]  113 	ld	hl, #0x2007
   6AE0 CD 71 6D      [17]  114 	call	_cpct_isKeyPressed
   6AE3 7D            [ 4]  115 	ld	a, l
   6AE4 FD 21 59 75   [14]  116 	ld	iy, #_key_right_is_pressed
   6AE8 FD B6 00      [19]  117 	or	a, 0 (iy)
   6AEB FD 77 00      [19]  118 	ld	0 (iy), a
                            119 ;src/keys.c:30: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   6AEE 21 00 01      [10]  120 	ld	hl, #0x0100
   6AF1 CD 71 6D      [17]  121 	call	_cpct_isKeyPressed
   6AF4 FD 21 5A 75   [14]  122 	ld	iy, #_key_serve_is_pressed
   6AF8 FD 75 00      [19]  123 	ld	0 (iy), l
                            124 ;src/keys.c:31: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   6AFB 21 07 08      [10]  125 	ld	hl, #0x0807
   6AFE CD 71 6D      [17]  126 	call	_cpct_isKeyPressed
   6B01 7D            [ 4]  127 	ld	a, l
   6B02 FD 21 5A 75   [14]  128 	ld	iy, #_key_serve_is_pressed
   6B06 FD B6 00      [19]  129 	or	a, 0 (iy)
   6B09 FD 77 00      [19]  130 	ld	0 (iy), a
                            131 ;src/keys.c:34: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   6B0C 21 04 01      [10]  132 	ld	hl, #0x0104
   6B0F CD 71 6D      [17]  133 	call	_cpct_isKeyPressed
   6B12 FD 21 5B 75   [14]  134 	ld	iy, #_key_auto_is_pressed
   6B16 FD 75 00      [19]  135 	ld	0 (iy), l
                            136 ;src/keys.c:35: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   6B19 CD 67 70      [17]  137 	call	_cpct_isAnyKeyPressed_f
   6B1C FD 21 5C 75   [14]  138 	ld	iy, #_key_any_is_pressed
   6B20 FD 75 00      [19]  139 	ld	0 (iy), l
   6B23 C9            [10]  140 	ret
                            141 	.area _CODE
                            142 	.area _INITIALIZER
                            143 	.area _CABS (ABS)
