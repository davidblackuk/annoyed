                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module autoplay
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _auto_update
                             12 	.globl _auto_initialize
                             13 	.globl _keys_resetAllKeys
                             14 	.globl _balls_get_first_active
                             15 	.globl _is_controling
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
   839B                      23 _is_controling::
   839B                      24 	.ds 1
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/autoplay.c:10: void auto_initialize() {
                             50 ;	---------------------------------
                             51 ; Function auto_initialize
                             52 ; ---------------------------------
   698B                      53 _auto_initialize::
                             54 ;src/autoplay.c:11: is_controling = 0;
   698B 21 9B 83      [10]   55 	ld	hl,#_is_controling + 0
   698E 36 00         [10]   56 	ld	(hl), #0x00
   6990 C9            [10]   57 	ret
                             58 ;src/autoplay.c:14: void auto_update() {
                             59 ;	---------------------------------
                             60 ; Function auto_update
                             61 ; ---------------------------------
   6991                      62 _auto_update::
                             63 ;src/autoplay.c:17: if (key_auto_is_pressed) {
   6991 3A 32 88      [13]   64 	ld	a,(#_key_auto_is_pressed + 0)
   6994 B7            [ 4]   65 	or	a, a
   6995 28 10         [12]   66 	jr	Z,00102$
                             67 ;src/autoplay.c:18: is_controling = is_controling ? 0 : 1;
   6997 3A 9B 83      [13]   68 	ld	a,(#_is_controling + 0)
   699A B7            [ 4]   69 	or	a, a
   699B 28 04         [12]   70 	jr	Z,00117$
   699D 0E 00         [ 7]   71 	ld	c, #0x00
   699F 18 02         [12]   72 	jr	00118$
   69A1                      73 00117$:
   69A1 0E 01         [ 7]   74 	ld	c, #0x01
   69A3                      75 00118$:
   69A3 21 9B 83      [10]   76 	ld	hl,#_is_controling + 0
   69A6 71            [ 7]   77 	ld	(hl), c
   69A7                      78 00102$:
                             79 ;src/autoplay.c:21: if (is_controling) {
   69A7 3A 9B 83      [13]   80 	ld	a,(#_is_controling + 0)
   69AA B7            [ 4]   81 	or	a, a
   69AB C8            [11]   82 	ret	Z
                             83 ;src/autoplay.c:22: Ball* ball = balls_get_first_active();
   69AC CD 5A 6C      [17]   84 	call	_balls_get_first_active
                             85 ;src/autoplay.c:24: keys_resetAllKeys();
   69AF E5            [11]   86 	push	hl
   69B0 CD 6A 79      [17]   87 	call	_keys_resetAllKeys
   69B3 C1            [10]   88 	pop	bc
                             89 ;src/autoplay.c:25: if (ball != NULL) {
   69B4 78            [ 4]   90 	ld	a, b
   69B5 B1            [ 4]   91 	or	a,c
   69B6 C8            [11]   92 	ret	Z
                             93 ;src/autoplay.c:26: mid_bat_x = batX + (batW / 2);
   69B7 21 40 88      [10]   94 	ld	hl,#_batW + 0
   69BA 5E            [ 7]   95 	ld	e, (hl)
   69BB CB 3B         [ 8]   96 	srl	e
   69BD 3A 3E 88      [13]   97 	ld	a,(#_batX + 0)
   69C0 83            [ 4]   98 	add	a, e
   69C1 5F            [ 4]   99 	ld	e, a
                            100 ;src/autoplay.c:27: if (serving) {
   69C2 3A C5 83      [13]  101 	ld	a,(#_serving + 0)
   69C5 B7            [ 4]  102 	or	a, a
   69C6 28 06         [12]  103 	jr	Z,00109$
                            104 ;src/autoplay.c:28: key_serve_is_pressed = 1;
   69C8 21 31 88      [10]  105 	ld	hl,#_key_serve_is_pressed + 0
   69CB 36 01         [10]  106 	ld	(hl), #0x01
   69CD C9            [10]  107 	ret
   69CE                     108 00109$:
                            109 ;src/autoplay.c:29: } else if (mid_bat_x < ball->x ) {
   69CE 69            [ 4]  110 	ld	l, c
   69CF 60            [ 4]  111 	ld	h, b
   69D0 23            [ 6]  112 	inc	hl
   69D1 4E            [ 7]  113 	ld	c, (hl)
   69D2 23            [ 6]  114 	inc	hl
   69D3 46            [ 7]  115 	ld	b, (hl)
   69D4 16 00         [ 7]  116 	ld	d, #0x00
   69D6 7B            [ 4]  117 	ld	a, e
   69D7 91            [ 4]  118 	sub	a, c
   69D8 7A            [ 4]  119 	ld	a, d
   69D9 98            [ 4]  120 	sbc	a, b
   69DA E2 DF 69      [10]  121 	jp	PO, 00147$
   69DD EE 80         [ 7]  122 	xor	a, #0x80
   69DF                     123 00147$:
   69DF F2 E8 69      [10]  124 	jp	P, 00106$
                            125 ;src/autoplay.c:30: key_right_is_pressed = 1;
   69E2 21 30 88      [10]  126 	ld	hl,#_key_right_is_pressed + 0
   69E5 36 01         [10]  127 	ld	(hl), #0x01
   69E7 C9            [10]  128 	ret
   69E8                     129 00106$:
                            130 ;src/autoplay.c:31: } else if (mid_bat_x > ball->x ) {
   69E8 79            [ 4]  131 	ld	a, c
   69E9 93            [ 4]  132 	sub	a, e
   69EA 78            [ 4]  133 	ld	a, b
   69EB 9A            [ 4]  134 	sbc	a, d
   69EC E2 F1 69      [10]  135 	jp	PO, 00148$
   69EF EE 80         [ 7]  136 	xor	a, #0x80
   69F1                     137 00148$:
   69F1 F0            [11]  138 	ret	P
                            139 ;src/autoplay.c:32: key_left_is_pressed = 1;
   69F2 21 2F 88      [10]  140 	ld	hl,#_key_left_is_pressed + 0
   69F5 36 01         [10]  141 	ld	(hl), #0x01
   69F7 C9            [10]  142 	ret
                            143 	.area _CODE
                            144 	.area _INITIALIZER
                            145 	.area _CABS (ABS)
