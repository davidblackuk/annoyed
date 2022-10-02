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
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 ;src/autoplay.c:11: void auto_initialize() {
                             47 ;	---------------------------------
                             48 ; Function auto_initialize
                             49 ; ---------------------------------
   4AE4                      50 _auto_initialize::
                             51 ;src/autoplay.c:13: }
   4AE4 C9            [10]   52 	ret
                             53 ;src/autoplay.c:15: void auto_update() {
                             54 ;	---------------------------------
                             55 ; Function auto_update
                             56 ; ---------------------------------
   4AE5                      57 _auto_update::
                             58 ;src/autoplay.c:17: Ball* ball = balls_get_first_active();
   4AE5 CD D8 4C      [17]   59 	call	_balls_get_first_active
                             60 ;src/autoplay.c:19: keys_resetAllKeys();
   4AE8 E5            [11]   61 	push	hl
   4AE9 CD FF 4F      [17]   62 	call	_keys_resetAllKeys
   4AEC C1            [10]   63 	pop	bc
                             64 ;src/autoplay.c:21: if (ball != NULL) {
   4AED 78            [ 4]   65 	ld	a, b
   4AEE B1            [ 4]   66 	or	a,c
   4AEF C8            [11]   67 	ret	Z
                             68 ;src/autoplay.c:22: if (serving) {
   4AF0 3A 7F 54      [13]   69 	ld	a,(#_serving + 0)
   4AF3 B7            [ 4]   70 	or	a, a
   4AF4 28 06         [12]   71 	jr	Z,00107$
                             72 ;src/autoplay.c:23: key_serve_is_pressed = 1;
   4AF6 21 82 54      [10]   73 	ld	hl,#_key_serve_is_pressed + 0
   4AF9 36 01         [10]   74 	ld	(hl), #0x01
   4AFB C9            [10]   75 	ret
   4AFC                      76 00107$:
                             77 ;src/autoplay.c:24: } else if (batX < ball->x) {
   4AFC 69            [ 4]   78 	ld	l, c
   4AFD 60            [ 4]   79 	ld	h, b
   4AFE 23            [ 6]   80 	inc	hl
   4AFF 4E            [ 7]   81 	ld	c, (hl)
   4B00 3A 84 54      [13]   82 	ld	a,(#_batX + 0)
   4B03 91            [ 4]   83 	sub	a, c
   4B04 30 06         [12]   84 	jr	NC,00104$
                             85 ;src/autoplay.c:25: key_right_is_pressed = 1;
   4B06 21 81 54      [10]   86 	ld	hl,#_key_right_is_pressed + 0
   4B09 36 01         [10]   87 	ld	(hl), #0x01
   4B0B C9            [10]   88 	ret
   4B0C                      89 00104$:
                             90 ;src/autoplay.c:26: } else if (batX > ball->x) {
   4B0C 79            [ 4]   91 	ld	a, c
   4B0D FD 21 84 54   [14]   92 	ld	iy, #_batX
   4B11 FD 96 00      [19]   93 	sub	a, 0 (iy)
   4B14 D0            [11]   94 	ret	NC
                             95 ;src/autoplay.c:27: key_left_is_pressed = 1;
   4B15 21 80 54      [10]   96 	ld	hl,#_key_left_is_pressed + 0
   4B18 36 01         [10]   97 	ld	(hl), #0x01
   4B1A C9            [10]   98 	ret
                             99 	.area _CODE
                            100 	.area _INITIALIZER
                            101 	.area _CABS (ABS)
