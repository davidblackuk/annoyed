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
   92AC                      30 _key_left_is_pressed::
   92AC                      31 	.ds 1
   92AD                      32 _key_right_is_pressed::
   92AD                      33 	.ds 1
   92AE                      34 _key_serve_is_pressed::
   92AE                      35 	.ds 1
   92AF                      36 _key_auto_is_pressed::
   92AF                      37 	.ds 1
   92B0                      38 _key_any_is_pressed::
   92B0                      39 	.ds 1
   92B1                      40 _key_pause_is_pressed::
   92B1                      41 	.ds 1
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
   83ED                      70 _keys_initialize::
                             71 ;src/keys.c:23: keys_resetAllKeys();
   83ED C3 F0 83      [10]   72 	jp  _keys_resetAllKeys
                             73 ;src/keys.c:26: void keys_resetAllKeys()
                             74 ;	---------------------------------
                             75 ; Function keys_resetAllKeys
                             76 ; ---------------------------------
   83F0                      77 _keys_resetAllKeys::
                             78 ;src/keys.c:28: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   83F0 21 AE 92      [10]   79 	ld	hl,#_key_serve_is_pressed + 0
   83F3 36 00         [10]   80 	ld	(hl), #0x00
   83F5 21 AD 92      [10]   81 	ld	hl,#_key_right_is_pressed + 0
   83F8 36 00         [10]   82 	ld	(hl), #0x00
   83FA 21 AC 92      [10]   83 	ld	hl,#_key_left_is_pressed + 0
   83FD 36 00         [10]   84 	ld	(hl), #0x00
                             85 ;src/keys.c:29: key_auto_is_pressed = key_any_is_pressed = 0;
   83FF 21 B0 92      [10]   86 	ld	hl,#_key_any_is_pressed + 0
   8402 36 00         [10]   87 	ld	(hl), #0x00
   8404 21 AF 92      [10]   88 	ld	hl,#_key_auto_is_pressed + 0
   8407 36 00         [10]   89 	ld	(hl), #0x00
   8409 C9            [10]   90 	ret
                             91 ;src/keys.c:33: void keys_update()
                             92 ;	---------------------------------
                             93 ; Function keys_update
                             94 ; ---------------------------------
   840A                      95 _keys_update::
                             96 ;src/keys.c:35: cpct_scanKeyboard_f();
   840A CD 63 89      [17]   97 	call	_cpct_scanKeyboard_f
                             98 ;src/keys.c:36: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   840D 21 01 01      [10]   99 	ld	hl, #0x0101
   8410 CD 57 89      [17]  100 	call	_cpct_isKeyPressed
   8413 FD 21 AC 92   [14]  101 	ld	iy, #_key_left_is_pressed
   8417 FD 75 00      [19]  102 	ld	0 (iy), l
                            103 ;src/keys.c:37: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   841A 21 08 20      [10]  104 	ld	hl, #0x2008
   841D CD 57 89      [17]  105 	call	_cpct_isKeyPressed
   8420 7D            [ 4]  106 	ld	a, l
   8421 FD 21 AC 92   [14]  107 	ld	iy, #_key_left_is_pressed
   8425 FD B6 00      [19]  108 	or	a, 0 (iy)
   8428 FD 77 00      [19]  109 	ld	0 (iy), a
                            110 ;src/keys.c:39: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   842B 21 00 02      [10]  111 	ld	hl, #0x0200
   842E CD 57 89      [17]  112 	call	_cpct_isKeyPressed
   8431 FD 21 AD 92   [14]  113 	ld	iy, #_key_right_is_pressed
   8435 FD 75 00      [19]  114 	ld	0 (iy), l
                            115 ;src/keys.c:40: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   8438 21 07 20      [10]  116 	ld	hl, #0x2007
   843B CD 57 89      [17]  117 	call	_cpct_isKeyPressed
   843E 7D            [ 4]  118 	ld	a, l
   843F FD 21 AD 92   [14]  119 	ld	iy, #_key_right_is_pressed
   8443 FD B6 00      [19]  120 	or	a, 0 (iy)
   8446 FD 77 00      [19]  121 	ld	0 (iy), a
                            122 ;src/keys.c:42: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   8449 21 00 01      [10]  123 	ld	hl, #0x0100
   844C CD 57 89      [17]  124 	call	_cpct_isKeyPressed
   844F FD 21 AE 92   [14]  125 	ld	iy, #_key_serve_is_pressed
   8453 FD 75 00      [19]  126 	ld	0 (iy), l
                            127 ;src/keys.c:43: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   8456 21 07 08      [10]  128 	ld	hl, #0x0807
   8459 CD 57 89      [17]  129 	call	_cpct_isKeyPressed
   845C 7D            [ 4]  130 	ld	a, l
   845D FD 21 AE 92   [14]  131 	ld	iy, #_key_serve_is_pressed
   8461 FD B6 00      [19]  132 	or	a, 0 (iy)
   8464 FD 77 00      [19]  133 	ld	0 (iy), a
                            134 ;src/keys.c:45: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   8467 21 04 01      [10]  135 	ld	hl, #0x0104
   846A CD 57 89      [17]  136 	call	_cpct_isKeyPressed
   846D FD 21 AF 92   [14]  137 	ld	iy, #_key_auto_is_pressed
   8471 FD 75 00      [19]  138 	ld	0 (iy), l
                            139 ;src/keys.c:46: key_pause_is_pressed = cpct_isKeyPressed(Key_1);
   8474 21 08 01      [10]  140 	ld	hl, #0x0108
   8477 CD 57 89      [17]  141 	call	_cpct_isKeyPressed
   847A FD 21 B1 92   [14]  142 	ld	iy, #_key_pause_is_pressed
   847E FD 75 00      [19]  143 	ld	0 (iy), l
                            144 ;src/keys.c:48: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   8481 CD F5 8B      [17]  145 	call	_cpct_isAnyKeyPressed_f
   8484 FD 21 B0 92   [14]  146 	ld	iy, #_key_any_is_pressed
   8488 FD 75 00      [19]  147 	ld	0 (iy), l
   848B C9            [10]  148 	ret
                            149 	.area _CODE
                            150 	.area _INITIALIZER
                            151 	.area _CABS (ABS)
