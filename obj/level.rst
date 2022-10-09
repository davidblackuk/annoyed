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
                             15 	.globl _bricks_initialize
                             16 	.globl _background_initialize
                             17 	.globl _balls_get_first_active
                             18 	.globl _balls_draw
                             19 	.globl _balls_restore_background
                             20 	.globl _balls_update
                             21 	.globl _balls_initialize
                             22 	.globl _bat_draw
                             23 	.globl _bat_restore_background
                             24 	.globl _bat_update
                             25 	.globl _bat_initialize
                             26 	.globl _cpct_memset
                             27 	.globl _level_initialize
                             28 	.globl _level_draw
                             29 	.globl _level_update
                             30 ;--------------------------------------------------------
                             31 ; special function registers
                             32 ;--------------------------------------------------------
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DATA
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _INITIALIZED
                             41 ;--------------------------------------------------------
                             42 ; absolute external ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DABS (ABS)
                             45 ;--------------------------------------------------------
                             46 ; global & static initialisations
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _GSINIT
                             50 	.area _GSFINAL
                             51 	.area _GSINIT
                             52 ;--------------------------------------------------------
                             53 ; Home
                             54 ;--------------------------------------------------------
                             55 	.area _HOME
                             56 	.area _HOME
                             57 ;--------------------------------------------------------
                             58 ; code
                             59 ;--------------------------------------------------------
                             60 	.area _CODE
                             61 ;src/level.c:14: void level_initialize()
                             62 ;	---------------------------------
                             63 ; Function level_initialize
                             64 ; ---------------------------------
   66E7                      65 _level_initialize::
                             66 ;src/level.c:16: cpct_clearScreen(AN_PEN_BLACK);
   66E7 21 00 40      [10]   67 	ld	hl, #0x4000
   66EA E5            [11]   68 	push	hl
   66EB AF            [ 4]   69 	xor	a, a
   66EC F5            [11]   70 	push	af
   66ED 33            [ 6]   71 	inc	sp
   66EE 26 C0         [ 7]   72 	ld	h, #0xc0
   66F0 E5            [11]   73 	push	hl
   66F1 CD 41 6C      [17]   74 	call	_cpct_memset
                             75 ;src/level.c:18: background_initialize();
   66F4 CD D6 60      [17]   76 	call	_background_initialize
                             77 ;src/level.c:19: bricks_initialize();
   66F7 CD 71 65      [17]   78 	call	_bricks_initialize
                             79 ;src/level.c:20: auto_initialize();
   66FA CD 6F 60      [17]   80 	call	_auto_initialize
                             81 ;src/level.c:22: keys_initialize();
   66FD CD 55 66      [17]   82 	call	_keys_initialize
                             83 ;src/level.c:23: bat_initialize();
   6700 CD A4 64      [17]   84 	call	_bat_initialize
                             85 ;src/level.c:24: balls_initialize();
   6703 CD 8F 61      [17]   86 	call	_balls_initialize
   6706 C9            [10]   87 	ret
                             88 ;src/level.c:27: void level_draw()
                             89 ;	---------------------------------
                             90 ; Function level_draw
                             91 ; ---------------------------------
   6707                      92 _level_draw::
                             93 ;src/level.c:30: bat_restore_background();
   6707 CD 00 65      [17]   94 	call	_bat_restore_background
                             95 ;src/level.c:31: balls_restore_background();
   670A CD 2B 62      [17]   96 	call	_balls_restore_background
                             97 ;src/level.c:34: bat_draw();
   670D CD 19 65      [17]   98 	call	_bat_draw
                             99 ;src/level.c:35: balls_draw();
   6710 C3 6F 62      [10]  100 	jp  _balls_draw
                            101 ;src/level.c:38: SceneState level_update()
                            102 ;	---------------------------------
                            103 ; Function level_update
                            104 ; ---------------------------------
   6713                     105 _level_update::
   6713 3B            [ 6]  106 	dec	sp
                            107 ;src/level.c:40: SceneState res = Continue;
   6714 FD 21 00 00   [14]  108 	ld	iy, #0
   6718 FD 39         [15]  109 	add	iy, sp
   671A FD 36 00 00   [19]  110 	ld	0 (iy), #0x00
                            111 ;src/level.c:41: keys_update();
   671E CD 72 66      [17]  112 	call	_keys_update
                            113 ;src/level.c:42: auto_update();
   6721 CD 75 60      [17]  114 	call	_auto_update
                            115 ;src/level.c:43: bat_update();
   6724 CD B9 64      [17]  116 	call	_bat_update
                            117 ;src/level.c:44: balls_update();
   6727 CD DD 61      [17]  118 	call	_balls_update
                            119 ;src/level.c:47: if (balls_get_first_active() == NULL) {
   672A CD 9D 62      [17]  120 	call	_balls_get_first_active
   672D 7C            [ 4]  121 	ld	a, h
   672E B5            [ 4]  122 	or	a,l
   672F 20 0A         [12]  123 	jr	NZ,00102$
                            124 ;src/level.c:48: res = LevelCompleteFail;
   6731 FD 21 00 00   [14]  125 	ld	iy, #0
   6735 FD 39         [15]  126 	add	iy, sp
   6737 FD 36 00 02   [19]  127 	ld	0 (iy), #0x02
   673B                     128 00102$:
                            129 ;src/level.c:51: return res;
   673B FD 21 00 00   [14]  130 	ld	iy, #0
   673F FD 39         [15]  131 	add	iy, sp
   6741 FD 6E 00      [19]  132 	ld	l, 0 (iy)
   6744 33            [ 6]  133 	inc	sp
   6745 C9            [10]  134 	ret
                            135 	.area _CODE
                            136 	.area _INITIALIZER
                            137 	.area _CABS (ABS)
