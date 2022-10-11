                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module level
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _auto_update
                             12 	.globl _auto_initialize
                             13 	.globl _keys_update
                             14 	.globl _keys_initialize
                             15 	.globl _blocks_restore_background
                             16 	.globl _blocks_draw
                             17 	.globl _blocks_initialize
                             18 	.globl _background_initialize
                             19 	.globl _balls_get_first_active
                             20 	.globl _balls_draw
                             21 	.globl _balls_restore_background
                             22 	.globl _balls_update
                             23 	.globl _balls_initialize
                             24 	.globl _bat_draw
                             25 	.globl _bat_restore_background
                             26 	.globl _bat_update
                             27 	.globl _bat_initialize
                             28 	.globl _cpct_memset
                             29 	.globl _level_initialize
                             30 	.globl _level_draw
                             31 	.globl _level_update
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
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
                             63 ;src/level.c:14: void level_initialize()
                             64 ;	---------------------------------
                             65 ; Function level_initialize
                             66 ; ---------------------------------
   6B24                      67 _level_initialize::
                             68 ;src/level.c:16: cpct_clearScreen(AN_PEN_BLACK);
   6B24 21 00 40      [10]   69 	ld	hl, #0x4000
   6B27 E5            [11]   70 	push	hl
   6B28 AF            [ 4]   71 	xor	a, a
   6B29 F5            [11]   72 	push	af
   6B2A 33            [ 6]   73 	inc	sp
   6B2B 26 C0         [ 7]   74 	ld	h, #0xc0
   6B2D E5            [11]   75 	push	hl
   6B2E CD 82 70      [17]   76 	call	_cpct_memset
                             77 ;src/level.c:18: background_initialize();
   6B31 CD D6 60      [17]   78 	call	_background_initialize
                             79 ;src/level.c:19: blocks_initialize();
   6B34 CD 81 65      [17]   80 	call	_blocks_initialize
                             81 ;src/level.c:20: auto_initialize();
   6B37 CD 6F 60      [17]   82 	call	_auto_initialize
                             83 ;src/level.c:22: keys_initialize();
   6B3A CD 92 6A      [17]   84 	call	_keys_initialize
                             85 ;src/level.c:23: bat_initialize();
   6B3D CD B4 64      [17]   86 	call	_bat_initialize
                             87 ;src/level.c:24: balls_initialize();
   6B40 CD 91 61      [17]   88 	call	_balls_initialize
   6B43 C9            [10]   89 	ret
                             90 ;src/level.c:27: void level_draw()
                             91 ;	---------------------------------
                             92 ; Function level_draw
                             93 ; ---------------------------------
   6B44                      94 _level_draw::
                             95 ;src/level.c:30: bat_restore_background();
   6B44 CD 10 65      [17]   96 	call	_bat_restore_background
                             97 ;src/level.c:31: balls_restore_background();
   6B47 CD 2D 62      [17]   98 	call	_balls_restore_background
                             99 ;src/level.c:32: blocks_restore_background();
   6B4A CD BC 65      [17]  100 	call	_blocks_restore_background
                            101 ;src/level.c:35: blocks_draw();
   6B4D CD BB 65      [17]  102 	call	_blocks_draw
                            103 ;src/level.c:36: bat_draw();
   6B50 CD 29 65      [17]  104 	call	_bat_draw
                            105 ;src/level.c:37: balls_draw();
   6B53 C3 71 62      [10]  106 	jp  _balls_draw
                            107 ;src/level.c:40: SceneState level_update()
                            108 ;	---------------------------------
                            109 ; Function level_update
                            110 ; ---------------------------------
   6B56                     111 _level_update::
   6B56 3B            [ 6]  112 	dec	sp
                            113 ;src/level.c:42: SceneState res = Continue;
   6B57 FD 21 00 00   [14]  114 	ld	iy, #0
   6B5B FD 39         [15]  115 	add	iy, sp
   6B5D FD 36 00 00   [19]  116 	ld	0 (iy), #0x00
                            117 ;src/level.c:43: keys_update();
   6B61 CD AF 6A      [17]  118 	call	_keys_update
                            119 ;src/level.c:44: auto_update();
   6B64 CD 75 60      [17]  120 	call	_auto_update
                            121 ;src/level.c:45: bat_update();
   6B67 CD C9 64      [17]  122 	call	_bat_update
                            123 ;src/level.c:46: balls_update();
   6B6A CD DF 61      [17]  124 	call	_balls_update
                            125 ;src/level.c:49: if (balls_get_first_active() == NULL) {
   6B6D CD 9F 62      [17]  126 	call	_balls_get_first_active
   6B70 7C            [ 4]  127 	ld	a, h
   6B71 B5            [ 4]  128 	or	a,l
   6B72 20 0A         [12]  129 	jr	NZ,00102$
                            130 ;src/level.c:50: res = LevelCompleteFail;
   6B74 FD 21 00 00   [14]  131 	ld	iy, #0
   6B78 FD 39         [15]  132 	add	iy, sp
   6B7A FD 36 00 02   [19]  133 	ld	0 (iy), #0x02
   6B7E                     134 00102$:
                            135 ;src/level.c:53: return res;
   6B7E FD 21 00 00   [14]  136 	ld	iy, #0
   6B82 FD 39         [15]  137 	add	iy, sp
   6B84 FD 6E 00      [19]  138 	ld	l, 0 (iy)
   6B87 33            [ 6]  139 	inc	sp
   6B88 C9            [10]  140 	ret
                            141 	.area _CODE
                            142 	.area _INITIALIZER
                            143 	.area _CABS (ABS)
