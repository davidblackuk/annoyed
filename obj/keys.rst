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
   8073                      30 _key_left_is_pressed::
   8073                      31 	.ds 1
   8074                      32 _key_right_is_pressed::
   8074                      33 	.ds 1
   8075                      34 _key_serve_is_pressed::
   8075                      35 	.ds 1
   8076                      36 _key_auto_is_pressed::
   8076                      37 	.ds 1
   8077                      38 _key_any_is_pressed::
   8077                      39 	.ds 1
   8078                      40 _key_pause_is_pressed::
   8078                      41 	.ds 1
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
                             66 ;src/keys.c:13: void keys_initialize() {
                             67 ;	---------------------------------
                             68 ; Function keys_initialize
                             69 ; ---------------------------------
   744C                      70 _keys_initialize::
                             71 ;src/keys.c:14: keys_resetAllKeys();    
   744C C3 4F 74      [10]   72 	jp  _keys_resetAllKeys
                             73 ;src/keys.c:17: void  keys_resetAllKeys() {
                             74 ;	---------------------------------
                             75 ; Function keys_resetAllKeys
                             76 ; ---------------------------------
   744F                      77 _keys_resetAllKeys::
                             78 ;src/keys.c:18: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   744F 21 75 80      [10]   79 	ld	hl,#_key_serve_is_pressed + 0
   7452 36 00         [10]   80 	ld	(hl), #0x00
   7454 21 74 80      [10]   81 	ld	hl,#_key_right_is_pressed + 0
   7457 36 00         [10]   82 	ld	(hl), #0x00
   7459 21 73 80      [10]   83 	ld	hl,#_key_left_is_pressed + 0
   745C 36 00         [10]   84 	ld	(hl), #0x00
                             85 ;src/keys.c:19: key_auto_is_pressed = key_any_is_pressed = 0;
   745E 21 77 80      [10]   86 	ld	hl,#_key_any_is_pressed + 0
   7461 36 00         [10]   87 	ld	(hl), #0x00
   7463 21 76 80      [10]   88 	ld	hl,#_key_auto_is_pressed + 0
   7466 36 00         [10]   89 	ld	(hl), #0x00
   7468 C9            [10]   90 	ret
                             91 ;src/keys.c:23: void keys_update() {
                             92 ;	---------------------------------
                             93 ; Function keys_update
                             94 ; ---------------------------------
   7469                      95 _keys_update::
                             96 ;src/keys.c:24: cpct_scanKeyboard_f();
   7469 CD E3 76      [17]   97 	call	_cpct_scanKeyboard_f
                             98 ;src/keys.c:25: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   746C 21 01 01      [10]   99 	ld	hl, #0x0101
   746F CD D7 76      [17]  100 	call	_cpct_isKeyPressed
   7472 FD 21 73 80   [14]  101 	ld	iy, #_key_left_is_pressed
   7476 FD 75 00      [19]  102 	ld	0 (iy), l
                            103 ;src/keys.c:26: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   7479 21 08 20      [10]  104 	ld	hl, #0x2008
   747C CD D7 76      [17]  105 	call	_cpct_isKeyPressed
   747F 7D            [ 4]  106 	ld	a, l
   7480 FD 21 73 80   [14]  107 	ld	iy, #_key_left_is_pressed
   7484 FD B6 00      [19]  108 	or	a, 0 (iy)
   7487 FD 77 00      [19]  109 	ld	0 (iy), a
                            110 ;src/keys.c:28: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   748A 21 00 02      [10]  111 	ld	hl, #0x0200
   748D CD D7 76      [17]  112 	call	_cpct_isKeyPressed
   7490 FD 21 74 80   [14]  113 	ld	iy, #_key_right_is_pressed
   7494 FD 75 00      [19]  114 	ld	0 (iy), l
                            115 ;src/keys.c:29: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   7497 21 07 20      [10]  116 	ld	hl, #0x2007
   749A CD D7 76      [17]  117 	call	_cpct_isKeyPressed
   749D 7D            [ 4]  118 	ld	a, l
   749E FD 21 74 80   [14]  119 	ld	iy, #_key_right_is_pressed
   74A2 FD B6 00      [19]  120 	or	a, 0 (iy)
   74A5 FD 77 00      [19]  121 	ld	0 (iy), a
                            122 ;src/keys.c:31: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   74A8 21 00 01      [10]  123 	ld	hl, #0x0100
   74AB CD D7 76      [17]  124 	call	_cpct_isKeyPressed
   74AE FD 21 75 80   [14]  125 	ld	iy, #_key_serve_is_pressed
   74B2 FD 75 00      [19]  126 	ld	0 (iy), l
                            127 ;src/keys.c:32: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   74B5 21 07 08      [10]  128 	ld	hl, #0x0807
   74B8 CD D7 76      [17]  129 	call	_cpct_isKeyPressed
   74BB 7D            [ 4]  130 	ld	a, l
   74BC FD 21 75 80   [14]  131 	ld	iy, #_key_serve_is_pressed
   74C0 FD B6 00      [19]  132 	or	a, 0 (iy)
   74C3 FD 77 00      [19]  133 	ld	0 (iy), a
                            134 ;src/keys.c:35: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   74C6 21 04 01      [10]  135 	ld	hl, #0x0104
   74C9 CD D7 76      [17]  136 	call	_cpct_isKeyPressed
   74CC FD 21 76 80   [14]  137 	ld	iy, #_key_auto_is_pressed
   74D0 FD 75 00      [19]  138 	ld	0 (iy), l
                            139 ;src/keys.c:36: key_pause_is_pressed = cpct_isKeyPressed(Key_1);
   74D3 21 08 01      [10]  140 	ld	hl, #0x0108
   74D6 CD D7 76      [17]  141 	call	_cpct_isKeyPressed
   74D9 FD 21 78 80   [14]  142 	ld	iy, #_key_pause_is_pressed
   74DD FD 75 00      [19]  143 	ld	0 (iy), l
                            144 ;src/keys.c:37: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   74E0 CD CD 79      [17]  145 	call	_cpct_isAnyKeyPressed_f
   74E3 FD 21 77 80   [14]  146 	ld	iy, #_key_any_is_pressed
   74E7 FD 75 00      [19]  147 	ld	0 (iy), l
   74EA C9            [10]  148 	ret
                            149 	.area _CODE
                            150 	.area _INITIALIZER
                            151 	.area _CABS (ABS)
