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
   6D6E                      23 _is_controling::
   6D6E                      24 	.ds 1
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
   606F                      53 _auto_initialize::
                             54 ;src/autoplay.c:12: is_controling = 0;
   606F 21 6E 6D      [10]   55 	ld	hl,#_is_controling + 0
   6072 36 00         [10]   56 	ld	(hl), #0x00
   6074 C9            [10]   57 	ret
                             58 ;src/autoplay.c:15: void auto_update() {
                             59 ;	---------------------------------
                             60 ; Function auto_update
                             61 ; ---------------------------------
   6075                      62 _auto_update::
                             63 ;src/autoplay.c:18: if (key_auto_is_pressed) {
   6075 3A 97 6D      [13]   64 	ld	a,(#_key_auto_is_pressed + 0)
   6078 B7            [ 4]   65 	or	a, a
   6079 28 10         [12]   66 	jr	Z,00102$
                             67 ;src/autoplay.c:19: is_controling = is_controling ? 0 : 1;
   607B 3A 6E 6D      [13]   68 	ld	a,(#_is_controling + 0)
   607E B7            [ 4]   69 	or	a, a
   607F 28 04         [12]   70 	jr	Z,00117$
   6081 0E 00         [ 7]   71 	ld	c, #0x00
   6083 18 02         [12]   72 	jr	00118$
   6085                      73 00117$:
   6085 0E 01         [ 7]   74 	ld	c, #0x01
   6087                      75 00118$:
   6087 21 6E 6D      [10]   76 	ld	hl,#_is_controling + 0
   608A 71            [ 7]   77 	ld	(hl), c
   608B                      78 00102$:
                             79 ;src/autoplay.c:22: if (is_controling) {
   608B 3A 6E 6D      [13]   80 	ld	a,(#_is_controling + 0)
   608E B7            [ 4]   81 	or	a, a
   608F C8            [11]   82 	ret	Z
                             83 ;src/autoplay.c:23: Ball* ball = balls_get_first_active();
   6090 CD 9D 62      [17]   84 	call	_balls_get_first_active
                             85 ;src/autoplay.c:25: keys_resetAllKeys();
   6093 E5            [11]   86 	push	hl
   6094 CD 58 66      [17]   87 	call	_keys_resetAllKeys
   6097 C1            [10]   88 	pop	bc
                             89 ;src/autoplay.c:27: if (ball != NULL) {
   6098 78            [ 4]   90 	ld	a, b
   6099 B1            [ 4]   91 	or	a,c
   609A C8            [11]   92 	ret	Z
                             93 ;src/autoplay.c:28: if (serving) {
   609B 3A 86 6D      [13]   94 	ld	a,(#_serving + 0)
   609E B7            [ 4]   95 	or	a, a
   609F 28 06         [12]   96 	jr	Z,00109$
                             97 ;src/autoplay.c:29: key_serve_is_pressed = 1;
   60A1 21 96 6D      [10]   98 	ld	hl,#_key_serve_is_pressed + 0
   60A4 36 01         [10]   99 	ld	(hl), #0x01
   60A6 C9            [10]  100 	ret
   60A7                     101 00109$:
                            102 ;src/autoplay.c:30: } else if (batX < (ball->x + (SP_BALL_W / 2))) {
   60A7 69            [ 4]  103 	ld	l, c
   60A8 60            [ 4]  104 	ld	h, b
   60A9 23            [ 6]  105 	inc	hl
   60AA 4E            [ 7]  106 	ld	c, (hl)
   60AB 06 00         [ 7]  107 	ld	b, #0x00
   60AD 03            [ 6]  108 	inc	bc
   60AE 21 A2 6D      [10]  109 	ld	hl,#_batX + 0
   60B1 5E            [ 7]  110 	ld	e, (hl)
   60B2 16 00         [ 7]  111 	ld	d, #0x00
   60B4 7B            [ 4]  112 	ld	a, e
   60B5 91            [ 4]  113 	sub	a, c
   60B6 7A            [ 4]  114 	ld	a, d
   60B7 98            [ 4]  115 	sbc	a, b
   60B8 E2 BD 60      [10]  116 	jp	PO, 00147$
   60BB EE 80         [ 7]  117 	xor	a, #0x80
   60BD                     118 00147$:
   60BD F2 C6 60      [10]  119 	jp	P, 00106$
                            120 ;src/autoplay.c:31: key_right_is_pressed = 1;
   60C0 21 95 6D      [10]  121 	ld	hl,#_key_right_is_pressed + 0
   60C3 36 01         [10]  122 	ld	(hl), #0x01
   60C5 C9            [10]  123 	ret
   60C6                     124 00106$:
                            125 ;src/autoplay.c:32: } else if (batX > (ball->x + (SP_BALL_W / 2))) {
   60C6 79            [ 4]  126 	ld	a, c
   60C7 93            [ 4]  127 	sub	a, e
   60C8 78            [ 4]  128 	ld	a, b
   60C9 9A            [ 4]  129 	sbc	a, d
   60CA E2 CF 60      [10]  130 	jp	PO, 00148$
   60CD EE 80         [ 7]  131 	xor	a, #0x80
   60CF                     132 00148$:
   60CF F0            [11]  133 	ret	P
                            134 ;src/autoplay.c:33: key_left_is_pressed = 1;
   60D0 21 94 6D      [10]  135 	ld	hl,#_key_left_is_pressed + 0
   60D3 36 01         [10]  136 	ld	(hl), #0x01
   60D5 C9            [10]  137 	ret
                            138 	.area _CODE
                            139 	.area _INITIALIZER
                            140 	.area _CABS (ABS)
