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
   8ED1                      23 _is_controling::
   8ED1                      24 	.ds 1
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
                             49 ;src/autoplay.c:17: void auto_initialize()
                             50 ;	---------------------------------
                             51 ; Function auto_initialize
                             52 ; ---------------------------------
   7453                      53 _auto_initialize::
                             54 ;src/autoplay.c:19: is_controling = 0;
   7453 21 D1 8E      [10]   55 	ld	hl,#_is_controling + 0
   7456 36 00         [10]   56 	ld	(hl), #0x00
   7458 C9            [10]   57 	ret
                             58 ;src/autoplay.c:22: void auto_update()
                             59 ;	---------------------------------
                             60 ; Function auto_update
                             61 ; ---------------------------------
   7459                      62 _auto_update::
                             63 ;src/autoplay.c:26: if (key_auto_is_pressed)
   7459 3A 6A 93      [13]   64 	ld	a,(#_key_auto_is_pressed + 0)
   745C B7            [ 4]   65 	or	a, a
   745D 28 10         [12]   66 	jr	Z,00102$
                             67 ;src/autoplay.c:28: is_controling = is_controling ? 0 : 1;
   745F 3A D1 8E      [13]   68 	ld	a,(#_is_controling + 0)
   7462 B7            [ 4]   69 	or	a, a
   7463 28 04         [12]   70 	jr	Z,00117$
   7465 0E 00         [ 7]   71 	ld	c, #0x00
   7467 18 02         [12]   72 	jr	00118$
   7469                      73 00117$:
   7469 0E 01         [ 7]   74 	ld	c, #0x01
   746B                      75 00118$:
   746B 21 D1 8E      [10]   76 	ld	hl,#_is_controling + 0
   746E 71            [ 7]   77 	ld	(hl), c
   746F                      78 00102$:
                             79 ;src/autoplay.c:31: if (is_controling)
   746F 3A D1 8E      [13]   80 	ld	a,(#_is_controling + 0)
   7472 B7            [ 4]   81 	or	a, a
   7473 C8            [11]   82 	ret	Z
                             83 ;src/autoplay.c:33: Ball *ball = balls_get_first_active();
   7474 CD 51 77      [17]   84 	call	_balls_get_first_active
                             85 ;src/autoplay.c:35: keys_resetAllKeys();
   7477 E5            [11]   86 	push	hl
   7478 CD AB 84      [17]   87 	call	_keys_resetAllKeys
   747B C1            [10]   88 	pop	bc
                             89 ;src/autoplay.c:36: if (ball != NULL)
   747C 78            [ 4]   90 	ld	a, b
   747D B1            [ 4]   91 	or	a,c
   747E C8            [11]   92 	ret	Z
                             93 ;src/autoplay.c:38: mid_bat_x = batX + (batW / 2);
   747F 21 76 93      [10]   94 	ld	hl,#_batW + 0
   7482 5E            [ 7]   95 	ld	e, (hl)
   7483 CB 3B         [ 8]   96 	srl	e
   7485 3A 74 93      [13]   97 	ld	a,(#_batX + 0)
   7488 83            [ 4]   98 	add	a, e
   7489 5F            [ 4]   99 	ld	e, a
                            100 ;src/autoplay.c:39: if (serving)
   748A 3A FB 8E      [13]  101 	ld	a,(#_serving + 0)
   748D B7            [ 4]  102 	or	a, a
   748E 28 06         [12]  103 	jr	Z,00109$
                            104 ;src/autoplay.c:41: key_serve_is_pressed = 1;
   7490 21 69 93      [10]  105 	ld	hl,#_key_serve_is_pressed + 0
   7493 36 01         [10]  106 	ld	(hl), #0x01
   7495 C9            [10]  107 	ret
   7496                     108 00109$:
                            109 ;src/autoplay.c:43: else if (mid_bat_x < ball->x)
   7496 69            [ 4]  110 	ld	l, c
   7497 60            [ 4]  111 	ld	h, b
   7498 23            [ 6]  112 	inc	hl
   7499 4E            [ 7]  113 	ld	c, (hl)
   749A 23            [ 6]  114 	inc	hl
   749B 46            [ 7]  115 	ld	b, (hl)
   749C 16 00         [ 7]  116 	ld	d, #0x00
   749E 7B            [ 4]  117 	ld	a, e
   749F 91            [ 4]  118 	sub	a, c
   74A0 7A            [ 4]  119 	ld	a, d
   74A1 98            [ 4]  120 	sbc	a, b
   74A2 E2 A7 74      [10]  121 	jp	PO, 00147$
   74A5 EE 80         [ 7]  122 	xor	a, #0x80
   74A7                     123 00147$:
   74A7 F2 B0 74      [10]  124 	jp	P, 00106$
                            125 ;src/autoplay.c:45: key_right_is_pressed = 1;
   74AA 21 68 93      [10]  126 	ld	hl,#_key_right_is_pressed + 0
   74AD 36 01         [10]  127 	ld	(hl), #0x01
   74AF C9            [10]  128 	ret
   74B0                     129 00106$:
                            130 ;src/autoplay.c:47: else if (mid_bat_x > ball->x)
   74B0 79            [ 4]  131 	ld	a, c
   74B1 93            [ 4]  132 	sub	a, e
   74B2 78            [ 4]  133 	ld	a, b
   74B3 9A            [ 4]  134 	sbc	a, d
   74B4 E2 B9 74      [10]  135 	jp	PO, 00148$
   74B7 EE 80         [ 7]  136 	xor	a, #0x80
   74B9                     137 00148$:
   74B9 F0            [11]  138 	ret	P
                            139 ;src/autoplay.c:49: key_left_is_pressed = 1;
   74BA 21 67 93      [10]  140 	ld	hl,#_key_left_is_pressed + 0
   74BD 36 01         [10]  141 	ld	(hl), #0x01
   74BF C9            [10]  142 	ret
                            143 	.area _CODE
                            144 	.area _INITIALIZER
                            145 	.area _CABS (ABS)
