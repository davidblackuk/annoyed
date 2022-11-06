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
                             19 	.globl _bat_draw
                             20 	.globl _bat_restore_background
                             21 	.globl _bat_update
                             22 	.globl _bat_initialize
                             23 	.globl _balls_get_first_active
                             24 	.globl _balls_draw
                             25 	.globl _balls_restore_background
                             26 	.globl _balls_update
                             27 	.globl _balls_initialize
                             28 	.globl _cpct_memset
                             29 	.globl _level_initialize
                             30 	.globl _level_continue_from_death
                             31 	.globl _level_draw
                             32 	.globl _level_update
                             33 	.globl _level_initialize_internal
                             34 ;--------------------------------------------------------
                             35 ; special function registers
                             36 ;--------------------------------------------------------
                             37 ;--------------------------------------------------------
                             38 ; ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DATA
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _INITIALIZED
                             45 ;--------------------------------------------------------
                             46 ; absolute external ram data
                             47 ;--------------------------------------------------------
                             48 	.area _DABS (ABS)
                             49 ;--------------------------------------------------------
                             50 ; global & static initialisations
                             51 ;--------------------------------------------------------
                             52 	.area _HOME
                             53 	.area _GSINIT
                             54 	.area _GSFINAL
                             55 	.area _GSINIT
                             56 ;--------------------------------------------------------
                             57 ; Home
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _HOME
                             61 ;--------------------------------------------------------
                             62 ; code
                             63 ;--------------------------------------------------------
                             64 	.area _CODE
                             65 ;src/level.c:27: void level_initialize()
                             66 ;	---------------------------------
                             67 ; Function level_initialize
                             68 ; ---------------------------------
   8547                      69 _level_initialize::
                             70 ;src/level.c:29: level_initialize_internal(FALSE);
   8547 AF            [ 4]   71 	xor	a, a
   8548 F5            [11]   72 	push	af
   8549 33            [ 6]   73 	inc	sp
   854A CD B9 85      [17]   74 	call	_level_initialize_internal
   854D 33            [ 6]   75 	inc	sp
   854E C9            [10]   76 	ret
                             77 ;src/level.c:33: void level_continue_from_death()
                             78 ;	---------------------------------
                             79 ; Function level_continue_from_death
                             80 ; ---------------------------------
   854F                      81 _level_continue_from_death::
                             82 ;src/level.c:35: level_initialize_internal(TRUE);
   854F 3E 01         [ 7]   83 	ld	a, #0x01
   8551 F5            [11]   84 	push	af
   8552 33            [ 6]   85 	inc	sp
   8553 CD B9 85      [17]   86 	call	_level_initialize_internal
   8556 33            [ 6]   87 	inc	sp
   8557 C9            [10]   88 	ret
                             89 ;src/level.c:38: void level_draw()
                             90 ;	---------------------------------
                             91 ; Function level_draw
                             92 ; ---------------------------------
   8558                      93 _level_draw::
                             94 ;src/level.c:41: bat_restore_background();
   8558 CD 22 7A      [17]   95 	call	_bat_restore_background
                             96 ;src/level.c:42: balls_restore_background();
   855B CD A2 76      [17]   97 	call	_balls_restore_background
                             98 ;src/level.c:43: blocks_restore_background();
   855E CD 60 7B      [17]   99 	call	_blocks_restore_background
                            100 ;src/level.c:46: blocks_draw();
   8561 CD 5F 7B      [17]  101 	call	_blocks_draw
                            102 ;src/level.c:47: bat_draw();
   8564 CD 42 7A      [17]  103 	call	_bat_draw
                            104 ;src/level.c:48: balls_draw();
   8567 C3 FC 76      [10]  105 	jp  _balls_draw
                            106 ;src/level.c:51: SceneState level_update()
                            107 ;	---------------------------------
                            108 ; Function level_update
                            109 ; ---------------------------------
   856A                     110 _level_update::
   856A 3B            [ 6]  111 	dec	sp
                            112 ;src/level.c:54: SceneState res = Continue;
   856B FD 21 00 00   [14]  113 	ld	iy, #0
   856F FD 39         [15]  114 	add	iy, sp
   8571 FD 36 00 00   [19]  115 	ld	0 (iy), #0x00
                            116 ;src/level.c:56: do
   8575                     117 00101$:
                            118 ;src/level.c:58: keys_update();
   8575 CD C5 84      [17]  119 	call	_keys_update
                            120 ;src/level.c:59: } while (key_pause_is_pressed);
   8578 3A 6C 93      [13]  121 	ld	a,(#_key_pause_is_pressed + 0)
   857B B7            [ 4]  122 	or	a, a
   857C 20 F7         [12]  123 	jr	NZ,00101$
                            124 ;src/level.c:61: auto_update();
   857E CD 59 74      [17]  125 	call	_auto_update
                            126 ;src/level.c:62: bat_update();
   8581 CD E0 79      [17]  127 	call	_bat_update
                            128 ;src/level.c:63: balls_update();
   8584 CD 6F 76      [17]  129 	call	_balls_update
                            130 ;src/level.c:66: if (balls_get_first_active() == NULL)
   8587 CD 51 77      [17]  131 	call	_balls_get_first_active
   858A 7C            [ 4]  132 	ld	a, h
   858B B5            [ 4]  133 	or	a,l
   858C 20 0A         [12]  134 	jr	NZ,00105$
                            135 ;src/level.c:68: res = LevelCompleteFail;
   858E FD 21 00 00   [14]  136 	ld	iy, #0
   8592 FD 39         [15]  137 	add	iy, sp
   8594 FD 36 00 02   [19]  138 	ld	0 (iy), #0x02
   8598                     139 00105$:
                            140 ;src/level.c:70: if (blocks_remaining == 0)
   8598 FD 21 40 93   [14]  141 	ld	iy, #_blocks_remaining
   859C FD 7E 01      [19]  142 	ld	a, 1 (iy)
   859F FD B6 00      [19]  143 	or	a,0 (iy)
   85A2 20 0A         [12]  144 	jr	NZ,00107$
                            145 ;src/level.c:72: res = LevelCompleteSuccess;
   85A4 FD 21 00 00   [14]  146 	ld	iy, #0
   85A8 FD 39         [15]  147 	add	iy, sp
   85AA FD 36 00 03   [19]  148 	ld	0 (iy), #0x03
   85AE                     149 00107$:
                            150 ;src/level.c:75: return res;
   85AE FD 21 00 00   [14]  151 	ld	iy, #0
   85B2 FD 39         [15]  152 	add	iy, sp
   85B4 FD 6E 00      [19]  153 	ld	l, 0 (iy)
   85B7 33            [ 6]  154 	inc	sp
   85B8 C9            [10]  155 	ret
                            156 ;src/level.c:82: void level_initialize_internal(u8 is_restart)
                            157 ;	---------------------------------
                            158 ; Function level_initialize_internal
                            159 ; ---------------------------------
   85B9                     160 _level_initialize_internal::
                            161 ;src/level.c:84: cpct_clearScreen(AN_PEN_BLACK);
   85B9 21 00 40      [10]  162 	ld	hl, #0x4000
   85BC E5            [11]  163 	push	hl
   85BD AF            [ 4]  164 	xor	a, a
   85BE F5            [11]  165 	push	af
   85BF 33            [ 6]  166 	inc	sp
   85C0 26 C0         [ 7]  167 	ld	h, #0xc0
   85C2 E5            [11]  168 	push	hl
   85C3 CD CB 8C      [17]  169 	call	_cpct_memset
                            170 ;src/level.c:86: background_initialize();
   85C6 CD C0 74      [17]  171 	call	_background_initialize
                            172 ;src/level.c:87: blocks_initialize(is_restart);
   85C9 21 02 00      [10]  173 	ld	hl, #2+0
   85CC 39            [11]  174 	add	hl, sp
   85CD 7E            [ 7]  175 	ld	a, (hl)
   85CE F5            [11]  176 	push	af
   85CF 33            [ 6]  177 	inc	sp
   85D0 CD 50 7B      [17]  178 	call	_blocks_initialize
   85D3 33            [ 6]  179 	inc	sp
                            180 ;src/level.c:88: auto_initialize();
   85D4 CD 53 74      [17]  181 	call	_auto_initialize
                            182 ;src/level.c:90: keys_initialize();
   85D7 CD A8 84      [17]  183 	call	_keys_initialize
                            184 ;src/level.c:91: bat_initialize();
   85DA CD CB 79      [17]  185 	call	_bat_initialize
                            186 ;src/level.c:92: balls_initialize();
   85DD CD 5E 76      [17]  187 	call	_balls_initialize
   85E0 C9            [10]  188 	ret
                            189 	.area _CODE
                            190 	.area _INITIALIZER
                            191 	.area _CABS (ABS)
