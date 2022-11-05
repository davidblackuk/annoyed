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
   8824                      30 _key_left_is_pressed::
   8824                      31 	.ds 1
   8825                      32 _key_right_is_pressed::
   8825                      33 	.ds 1
   8826                      34 _key_serve_is_pressed::
   8826                      35 	.ds 1
   8827                      36 _key_auto_is_pressed::
   8827                      37 	.ds 1
   8828                      38 _key_any_is_pressed::
   8828                      39 	.ds 1
   8829                      40 _key_pause_is_pressed::
   8829                      41 	.ds 1
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
   7967                      70 _keys_initialize::
                             71 ;src/keys.c:23: keys_resetAllKeys();
   7967 C3 6A 79      [10]   72 	jp  _keys_resetAllKeys
                             73 ;src/keys.c:26: void keys_resetAllKeys()
                             74 ;	---------------------------------
                             75 ; Function keys_resetAllKeys
                             76 ; ---------------------------------
   796A                      77 _keys_resetAllKeys::
                             78 ;src/keys.c:28: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
   796A 21 26 88      [10]   79 	ld	hl,#_key_serve_is_pressed + 0
   796D 36 00         [10]   80 	ld	(hl), #0x00
   796F 21 25 88      [10]   81 	ld	hl,#_key_right_is_pressed + 0
   7972 36 00         [10]   82 	ld	(hl), #0x00
   7974 21 24 88      [10]   83 	ld	hl,#_key_left_is_pressed + 0
   7977 36 00         [10]   84 	ld	(hl), #0x00
                             85 ;src/keys.c:29: key_auto_is_pressed = key_any_is_pressed = 0;
   7979 21 28 88      [10]   86 	ld	hl,#_key_any_is_pressed + 0
   797C 36 00         [10]   87 	ld	(hl), #0x00
   797E 21 27 88      [10]   88 	ld	hl,#_key_auto_is_pressed + 0
   7981 36 00         [10]   89 	ld	(hl), #0x00
   7983 C9            [10]   90 	ret
                             91 ;src/keys.c:33: void keys_update()
                             92 ;	---------------------------------
                             93 ; Function keys_update
                             94 ; ---------------------------------
   7984                      95 _keys_update::
                             96 ;src/keys.c:35: cpct_scanKeyboard_f();
   7984 CD DD 7E      [17]   97 	call	_cpct_scanKeyboard_f
                             98 ;src/keys.c:36: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
   7987 21 01 01      [10]   99 	ld	hl, #0x0101
   798A CD D1 7E      [17]  100 	call	_cpct_isKeyPressed
   798D FD 21 24 88   [14]  101 	ld	iy, #_key_left_is_pressed
   7991 FD 75 00      [19]  102 	ld	0 (iy), l
                            103 ;src/keys.c:37: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
   7994 21 08 20      [10]  104 	ld	hl, #0x2008
   7997 CD D1 7E      [17]  105 	call	_cpct_isKeyPressed
   799A 7D            [ 4]  106 	ld	a, l
   799B FD 21 24 88   [14]  107 	ld	iy, #_key_left_is_pressed
   799F FD B6 00      [19]  108 	or	a, 0 (iy)
   79A2 FD 77 00      [19]  109 	ld	0 (iy), a
                            110 ;src/keys.c:39: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
   79A5 21 00 02      [10]  111 	ld	hl, #0x0200
   79A8 CD D1 7E      [17]  112 	call	_cpct_isKeyPressed
   79AB FD 21 25 88   [14]  113 	ld	iy, #_key_right_is_pressed
   79AF FD 75 00      [19]  114 	ld	0 (iy), l
                            115 ;src/keys.c:40: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
   79B2 21 07 20      [10]  116 	ld	hl, #0x2007
   79B5 CD D1 7E      [17]  117 	call	_cpct_isKeyPressed
   79B8 7D            [ 4]  118 	ld	a, l
   79B9 FD 21 25 88   [14]  119 	ld	iy, #_key_right_is_pressed
   79BD FD B6 00      [19]  120 	or	a, 0 (iy)
   79C0 FD 77 00      [19]  121 	ld	0 (iy), a
                            122 ;src/keys.c:42: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
   79C3 21 00 01      [10]  123 	ld	hl, #0x0100
   79C6 CD D1 7E      [17]  124 	call	_cpct_isKeyPressed
   79C9 FD 21 26 88   [14]  125 	ld	iy, #_key_serve_is_pressed
   79CD FD 75 00      [19]  126 	ld	0 (iy), l
                            127 ;src/keys.c:43: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
   79D0 21 07 08      [10]  128 	ld	hl, #0x0807
   79D3 CD D1 7E      [17]  129 	call	_cpct_isKeyPressed
   79D6 7D            [ 4]  130 	ld	a, l
   79D7 FD 21 26 88   [14]  131 	ld	iy, #_key_serve_is_pressed
   79DB FD B6 00      [19]  132 	or	a, 0 (iy)
   79DE FD 77 00      [19]  133 	ld	0 (iy), a
                            134 ;src/keys.c:45: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
   79E1 21 04 01      [10]  135 	ld	hl, #0x0104
   79E4 CD D1 7E      [17]  136 	call	_cpct_isKeyPressed
   79E7 FD 21 27 88   [14]  137 	ld	iy, #_key_auto_is_pressed
   79EB FD 75 00      [19]  138 	ld	0 (iy), l
                            139 ;src/keys.c:46: key_pause_is_pressed = cpct_isKeyPressed(Key_1);
   79EE 21 08 01      [10]  140 	ld	hl, #0x0108
   79F1 CD D1 7E      [17]  141 	call	_cpct_isKeyPressed
   79F4 FD 21 29 88   [14]  142 	ld	iy, #_key_pause_is_pressed
   79F8 FD 75 00      [19]  143 	ld	0 (iy), l
                            144 ;src/keys.c:47: key_any_is_pressed = cpct_isAnyKeyPressed_f();
   79FB CD 6F 81      [17]  145 	call	_cpct_isAnyKeyPressed_f
   79FE FD 21 28 88   [14]  146 	ld	iy, #_key_any_is_pressed
   7A02 FD 75 00      [19]  147 	ld	0 (iy), l
   7A05 C9            [10]  148 	ret
                            149 	.area _CODE
                            150 	.area _INITIALIZER
                            151 	.area _CABS (ABS)
