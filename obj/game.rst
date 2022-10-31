                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module game
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _game_update
                             12 	.globl _game_draw
                             13 	.globl _game_initialize
                             14 	.globl _hud_draw
                             15 	.globl _hud_update
                             16 	.globl _hud_continue_from_death
                             17 	.globl _hud_initialize
                             18 	.globl _level_update
                             19 	.globl _level_draw
                             20 	.globl _level_continue_from_death
                             21 	.globl _level_initialize
                             22 	.globl _score
                             23 	.globl _lives_left
                             24 	.globl _current_level_num
                             25 	.globl _current_state
                             26 	.globl _scene_game
                             27 	.globl _module_game_initialize
                             28 	.globl _initialise_level
                             29 ;--------------------------------------------------------
                             30 ; special function registers
                             31 ;--------------------------------------------------------
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DATA
   8066                      36 _scene_game::
   8066                      37 	.ds 6
   806C                      38 _current_state::
   806C                      39 	.ds 1
   806D                      40 _current_level_num::
   806D                      41 	.ds 1
   806E                      42 _lives_left::
   806E                      43 	.ds 1
   806F                      44 _score::
   806F                      45 	.ds 2
                             46 ;--------------------------------------------------------
                             47 ; ram data
                             48 ;--------------------------------------------------------
                             49 	.area _INITIALIZED
                             50 ;--------------------------------------------------------
                             51 ; absolute external ram data
                             52 ;--------------------------------------------------------
                             53 	.area _DABS (ABS)
                             54 ;--------------------------------------------------------
                             55 ; global & static initialisations
                             56 ;--------------------------------------------------------
                             57 	.area _HOME
                             58 	.area _GSINIT
                             59 	.area _GSFINAL
                             60 	.area _GSINIT
                             61 ;--------------------------------------------------------
                             62 ; Home
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _HOME
                             66 ;--------------------------------------------------------
                             67 ; code
                             68 ;--------------------------------------------------------
                             69 	.area _CODE
                             70 ;src/game.c:17: void game_initialize()
                             71 ;	---------------------------------
                             72 ; Function game_initialize
                             73 ; ---------------------------------
   7361                      74 _game_initialize::
                             75 ;src/game.c:19: current_level_num = 0;
   7361 21 6D 80      [10]   76 	ld	hl,#_current_level_num + 0
   7364 36 00         [10]   77 	ld	(hl), #0x00
                             78 ;src/game.c:20: lives_left = INITIAL_LIVES;
   7366 21 6E 80      [10]   79 	ld	hl,#_lives_left + 0
   7369 36 06         [10]   80 	ld	(hl), #0x06
                             81 ;src/game.c:21: current_state = Continue;
   736B 21 6C 80      [10]   82 	ld	hl,#_current_state + 0
   736E 36 00         [10]   83 	ld	(hl), #0x00
                             84 ;src/game.c:22: initialise_level();    
   7370 C3 B4 73      [10]   85 	jp  _initialise_level
                             86 ;src/game.c:25: void game_draw()
                             87 ;	---------------------------------
                             88 ; Function game_draw
                             89 ; ---------------------------------
   7373                      90 _game_draw::
                             91 ;src/game.c:27: level_draw();
   7373 CD FC 74      [17]   92 	call	_level_draw
                             93 ;src/game.c:29: hud_draw();
   7376 C3 EB 73      [10]   94 	jp  _hud_draw
                             95 ;src/game.c:33: SceneState game_update()
                             96 ;	---------------------------------
                             97 ; Function game_update
                             98 ; ---------------------------------
   7379                      99 _game_update::
                            100 ;src/game.c:37: res = level_update();
   7379 CD 0E 75      [17]  101 	call	_level_update
                            102 ;src/game.c:38: hud_update();
   737C E5            [11]  103 	push	hl
   737D CD E9 73      [17]  104 	call	_hud_update
   7380 E1            [10]  105 	pop	hl
                            106 ;src/game.c:41: if (res == LevelCompleteSuccess) {
                            107 ;src/game.c:43: } else if (res == LevelCompleteFail) {
   7381 7D            [ 4]  108 	ld	a,l
   7382 FE 03         [ 7]  109 	cp	a,#0x03
   7384 C8            [11]  110 	ret	Z
   7385 D6 02         [ 7]  111 	sub	a, #0x02
   7387 C0            [11]  112 	ret	NZ
                            113 ;src/game.c:44: lives_left -= 1;
   7388 FD 21 6E 80   [14]  114 	ld	iy, #_lives_left
   738C FD 35 00      [23]  115 	dec	0 (iy)
                            116 ;src/game.c:45: if (lives_left == 0) {
   738F FD 7E 00      [19]  117 	ld	a, 0 (iy)
   7392 B7            [ 4]  118 	or	a, a
   7393 20 03         [12]  119 	jr	NZ,00102$
                            120 ;src/game.c:46: return GameOver;
   7395 2E 04         [ 7]  121 	ld	l, #0x04
   7397 C9            [10]  122 	ret
   7398                     123 00102$:
                            124 ;src/game.c:48: level_continue_from_death();
   7398 CD F3 74      [17]  125 	call	_level_continue_from_death
                            126 ;src/game.c:49: hud_continue_from_death();
   739B CD E0 73      [17]  127 	call	_hud_continue_from_death
                            128 ;src/game.c:50: res = Continue;
   739E 2E 00         [ 7]  129 	ld	l, #0x00
                            130 ;src/game.c:54: return res;
   73A0 C9            [10]  131 	ret
                            132 ;src/game.c:57: void module_game_initialize()
                            133 ;	---------------------------------
                            134 ; Function module_game_initialize
                            135 ; ---------------------------------
   73A1                     136 _module_game_initialize::
                            137 ;src/game.c:59: scene_game.initialize = game_initialize;
   73A1 21 61 73      [10]  138 	ld	hl, #_game_initialize
   73A4 22 66 80      [16]  139 	ld	(_scene_game), hl
                            140 ;src/game.c:60: scene_game.update = game_update;
   73A7 21 79 73      [10]  141 	ld	hl, #_game_update
   73AA 22 6A 80      [16]  142 	ld	((_scene_game + 0x0004)), hl
                            143 ;src/game.c:61: scene_game.draw = game_draw;
   73AD 21 73 73      [10]  144 	ld	hl, #_game_draw
   73B0 22 68 80      [16]  145 	ld	((_scene_game + 0x0002)), hl
   73B3 C9            [10]  146 	ret
                            147 ;src/game.c:64: void initialise_level() {
                            148 ;	---------------------------------
                            149 ; Function initialise_level
                            150 ; ---------------------------------
   73B4                     151 _initialise_level::
                            152 ;src/game.c:65: current_level = level_definitions + current_level_num;
   73B4 01 CC 73      [10]  153 	ld	bc, #_level_definitions+0
   73B7 ED 5B 6D 80   [20]  154 	ld	de, (_current_level_num)
   73BB 16 00         [ 7]  155 	ld	d, #0x00
   73BD 6B            [ 4]  156 	ld	l, e
   73BE 62            [ 4]  157 	ld	h, d
   73BF 29            [11]  158 	add	hl, hl
   73C0 19            [11]  159 	add	hl, de
   73C1 29            [11]  160 	add	hl, hl
   73C2 09            [11]  161 	add	hl, bc
   73C3 22 71 80      [16]  162 	ld	(_current_level), hl
                            163 ;src/game.c:66: level_initialize();
   73C6 CD EB 74      [17]  164 	call	_level_initialize
                            165 ;src/game.c:67: hud_initialize();
   73C9 C3 D8 73      [10]  166 	jp  _hud_initialize
                            167 	.area _CODE
                            168 	.area _INITIALIZER
                            169 	.area _CABS (ABS)
