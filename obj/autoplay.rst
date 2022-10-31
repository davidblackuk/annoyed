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
   7BF7                      23 _is_controling::
   7BF7                      24 	.ds 1
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
                             49 ;src/autoplay.c:11: void auto_initialize() {
                             50 ;	---------------------------------
                             51 ; Function auto_initialize
                             52 ; ---------------------------------
   6669                      53 _auto_initialize::
                             54 ;src/autoplay.c:12: is_controling = 0;
   6669 21 F7 7B      [10]   55 	ld	hl,#_is_controling + 0
   666C 36 00         [10]   56 	ld	(hl), #0x00
   666E C9            [10]   57 	ret
                             58 ;src/autoplay.c:15: void auto_update() {
                             59 ;	---------------------------------
                             60 ; Function auto_update
                             61 ; ---------------------------------
   666F                      62 _auto_update::
                             63 ;src/autoplay.c:18: if (key_auto_is_pressed) {
   666F 3A 76 80      [13]   64 	ld	a,(#_key_auto_is_pressed + 0)
   6672 B7            [ 4]   65 	or	a, a
   6673 28 10         [12]   66 	jr	Z,00102$
                             67 ;src/autoplay.c:19: is_controling = is_controling ? 0 : 1;
   6675 3A F7 7B      [13]   68 	ld	a,(#_is_controling + 0)
   6678 B7            [ 4]   69 	or	a, a
   6679 28 04         [12]   70 	jr	Z,00117$
   667B 0E 00         [ 7]   71 	ld	c, #0x00
   667D 18 02         [12]   72 	jr	00118$
   667F                      73 00117$:
   667F 0E 01         [ 7]   74 	ld	c, #0x01
   6681                      75 00118$:
   6681 21 F7 7B      [10]   76 	ld	hl,#_is_controling + 0
   6684 71            [ 7]   77 	ld	(hl), c
   6685                      78 00102$:
                             79 ;src/autoplay.c:22: if (is_controling) {
   6685 3A F7 7B      [13]   80 	ld	a,(#_is_controling + 0)
   6688 B7            [ 4]   81 	or	a, a
   6689 C8            [11]   82 	ret	Z
                             83 ;src/autoplay.c:23: Ball* ball = balls_get_first_active();
   668A CD 65 69      [17]   84 	call	_balls_get_first_active
                             85 ;src/autoplay.c:25: keys_resetAllKeys();
   668D E5            [11]   86 	push	hl
   668E CD 4F 74      [17]   87 	call	_keys_resetAllKeys
   6691 C1            [10]   88 	pop	bc
                             89 ;src/autoplay.c:26: if (ball != NULL) {
   6692 78            [ 4]   90 	ld	a, b
   6693 B1            [ 4]   91 	or	a,c
   6694 C8            [11]   92 	ret	Z
                             93 ;src/autoplay.c:27: mid_bat_x = batX + (batW / 2);
   6695 21 84 80      [10]   94 	ld	hl,#_batW + 0
   6698 5E            [ 7]   95 	ld	e, (hl)
   6699 CB 3B         [ 8]   96 	srl	e
   669B 3A 82 80      [13]   97 	ld	a,(#_batX + 0)
   669E 83            [ 4]   98 	add	a, e
   669F 5F            [ 4]   99 	ld	e, a
                            100 ;src/autoplay.c:28: if (serving) {
   66A0 3A 21 7C      [13]  101 	ld	a,(#_serving + 0)
   66A3 B7            [ 4]  102 	or	a, a
   66A4 28 06         [12]  103 	jr	Z,00109$
                            104 ;src/autoplay.c:29: key_serve_is_pressed = 1;
   66A6 21 75 80      [10]  105 	ld	hl,#_key_serve_is_pressed + 0
   66A9 36 01         [10]  106 	ld	(hl), #0x01
   66AB C9            [10]  107 	ret
   66AC                     108 00109$:
                            109 ;src/autoplay.c:30: } else if (mid_bat_x < ball->x ) {
   66AC 69            [ 4]  110 	ld	l, c
   66AD 60            [ 4]  111 	ld	h, b
   66AE 23            [ 6]  112 	inc	hl
   66AF 4E            [ 7]  113 	ld	c, (hl)
   66B0 23            [ 6]  114 	inc	hl
   66B1 46            [ 7]  115 	ld	b, (hl)
   66B2 16 00         [ 7]  116 	ld	d, #0x00
   66B4 7B            [ 4]  117 	ld	a, e
   66B5 91            [ 4]  118 	sub	a, c
   66B6 7A            [ 4]  119 	ld	a, d
   66B7 98            [ 4]  120 	sbc	a, b
   66B8 E2 BD 66      [10]  121 	jp	PO, 00147$
   66BB EE 80         [ 7]  122 	xor	a, #0x80
   66BD                     123 00147$:
   66BD F2 C6 66      [10]  124 	jp	P, 00106$
                            125 ;src/autoplay.c:31: key_right_is_pressed = 1;
   66C0 21 74 80      [10]  126 	ld	hl,#_key_right_is_pressed + 0
   66C3 36 01         [10]  127 	ld	(hl), #0x01
   66C5 C9            [10]  128 	ret
   66C6                     129 00106$:
                            130 ;src/autoplay.c:32: } else if (mid_bat_x > ball->x ) {
   66C6 79            [ 4]  131 	ld	a, c
   66C7 93            [ 4]  132 	sub	a, e
   66C8 78            [ 4]  133 	ld	a, b
   66C9 9A            [ 4]  134 	sbc	a, d
   66CA E2 CF 66      [10]  135 	jp	PO, 00148$
   66CD EE 80         [ 7]  136 	xor	a, #0x80
   66CF                     137 00148$:
   66CF F0            [11]  138 	ret	P
                            139 ;src/autoplay.c:33: key_left_is_pressed = 1;
   66D0 21 73 80      [10]  140 	ld	hl,#_key_left_is_pressed + 0
   66D3 36 01         [10]  141 	ld	(hl), #0x01
   66D5 C9            [10]  142 	ret
                            143 	.area _CODE
                            144 	.area _INITIALIZER
                            145 	.area _CABS (ABS)
