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
                             22 	.globl _high_score
                             23 	.globl _current_score
                             24 	.globl _lives_left
                             25 	.globl _current_level_num
                             26 	.globl _current_state
                             27 	.globl _scene_game
                             28 	.globl _module_game_initialize
                             29 	.globl _initialise_level
                             30 ;--------------------------------------------------------
                             31 ; special function registers
                             32 ;--------------------------------------------------------
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DATA
   8801                      37 _scene_game::
   8801                      38 	.ds 6
   8807                      39 _current_state::
   8807                      40 	.ds 1
   8808                      41 _current_level_num::
   8808                      42 	.ds 1
   8809                      43 _lives_left::
   8809                      44 	.ds 1
   880A                      45 _current_score::
   880A                      46 	.ds 2
   880C                      47 _high_score::
   880C                      48 	.ds 2
                             49 ;--------------------------------------------------------
                             50 ; ram data
                             51 ;--------------------------------------------------------
                             52 	.area _INITIALIZED
                             53 ;--------------------------------------------------------
                             54 ; absolute external ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DABS (ABS)
                             57 ;--------------------------------------------------------
                             58 ; global & static initialisations
                             59 ;--------------------------------------------------------
                             60 	.area _HOME
                             61 	.area _GSINIT
                             62 	.area _GSFINAL
                             63 	.area _GSINIT
                             64 ;--------------------------------------------------------
                             65 ; Home
                             66 ;--------------------------------------------------------
                             67 	.area _HOME
                             68 	.area _HOME
                             69 ;--------------------------------------------------------
                             70 ; code
                             71 ;--------------------------------------------------------
                             72 	.area _CODE
                             73 ;src/game.c:26: void game_initialize()
                             74 ;	---------------------------------
                             75 ; Function game_initialize
                             76 ; ---------------------------------
   7686                      77 _game_initialize::
                             78 ;src/game.c:28: current_level_num = 0;
   7686 21 08 88      [10]   79 	ld	hl,#_current_level_num + 0
   7689 36 00         [10]   80 	ld	(hl), #0x00
                             81 ;src/game.c:29: current_score = 0;
   768B 21 00 00      [10]   82 	ld	hl, #0x0000
   768E 22 0A 88      [16]   83 	ld	(_current_score), hl
                             84 ;src/game.c:30: lives_left = INITIAL_LIVES;
   7691 21 09 88      [10]   85 	ld	hl,#_lives_left + 0
   7694 36 04         [10]   86 	ld	(hl), #0x04
                             87 ;src/game.c:31: current_state = Continue;
   7696 21 07 88      [10]   88 	ld	hl,#_current_state + 0
   7699 36 00         [10]   89 	ld	(hl), #0x00
                             90 ;src/game.c:32: initialise_level();    
   769B C3 F8 76      [10]   91 	jp  _initialise_level
                             92 ;src/game.c:35: void game_draw()
                             93 ;	---------------------------------
                             94 ; Function game_draw
                             95 ; ---------------------------------
   769E                      96 _game_draw::
                             97 ;src/game.c:37: level_draw();
   769E CD 17 7A      [17]   98 	call	_level_draw
                             99 ;src/game.c:39: hud_draw();
   76A1 C3 6B 77      [10]  100 	jp  _hud_draw
                            101 ;src/game.c:43: SceneState game_update()
                            102 ;	---------------------------------
                            103 ; Function game_update
                            104 ; ---------------------------------
   76A4                     105 _game_update::
                            106 ;src/game.c:47: res = level_update();
   76A4 CD 29 7A      [17]  107 	call	_level_update
                            108 ;src/game.c:48: hud_update();
   76A7 E5            [11]  109 	push	hl
   76A8 CD 69 77      [17]  110 	call	_hud_update
   76AB E1            [10]  111 	pop	hl
                            112 ;src/game.c:51: if (res == LevelCompleteSuccess) {
   76AC 7D            [ 4]  113 	ld	a, l
   76AD D6 03         [ 7]  114 	sub	a, #0x03
   76AF 20 17         [12]  115 	jr	NZ,00108$
                            116 ;src/game.c:52: current_level_num += 1;
   76B1 FD 21 08 88   [14]  117 	ld	iy, #_current_level_num
   76B5 FD 34 00      [23]  118 	inc	0 (iy)
                            119 ;src/game.c:53: if (current_level_num >= NUM_LEVELS) {
   76B8 FD 7E 00      [19]  120 	ld	a, 0 (iy)
   76BB D6 02         [ 7]  121 	sub	a, #0x02
   76BD 38 03         [12]  122 	jr	C,00102$
                            123 ;src/game.c:54: return GameOver;
   76BF 2E 04         [ 7]  124 	ld	l, #0x04
   76C1 C9            [10]  125 	ret
   76C2                     126 00102$:
                            127 ;src/game.c:56: initialise_level();
   76C2 CD F8 76      [17]  128 	call	_initialise_level
                            129 ;src/game.c:57: res = Continue;
   76C5 2E 00         [ 7]  130 	ld	l, #0x00
   76C7 C9            [10]  131 	ret
   76C8                     132 00108$:
                            133 ;src/game.c:59: } else if (res == LevelCompleteFail) {
   76C8 7D            [ 4]  134 	ld	a, l
   76C9 D6 02         [ 7]  135 	sub	a, #0x02
   76CB C0            [11]  136 	ret	NZ
                            137 ;src/game.c:60: lives_left -= 1;
   76CC FD 21 09 88   [14]  138 	ld	iy, #_lives_left
   76D0 FD 35 00      [23]  139 	dec	0 (iy)
                            140 ;src/game.c:61: if (lives_left == 0) {
   76D3 FD 7E 00      [19]  141 	ld	a, 0 (iy)
   76D6 B7            [ 4]  142 	or	a, a
   76D7 20 03         [12]  143 	jr	NZ,00104$
                            144 ;src/game.c:62: return GameOver;
   76D9 2E 04         [ 7]  145 	ld	l, #0x04
   76DB C9            [10]  146 	ret
   76DC                     147 00104$:
                            148 ;src/game.c:64: level_continue_from_death();
   76DC CD 0E 7A      [17]  149 	call	_level_continue_from_death
                            150 ;src/game.c:65: hud_continue_from_death();
   76DF CD 60 77      [17]  151 	call	_hud_continue_from_death
                            152 ;src/game.c:66: res = Continue;
   76E2 2E 00         [ 7]  153 	ld	l, #0x00
                            154 ;src/game.c:70: return res;
   76E4 C9            [10]  155 	ret
                            156 ;src/game.c:73: void module_game_initialize()
                            157 ;	---------------------------------
                            158 ; Function module_game_initialize
                            159 ; ---------------------------------
   76E5                     160 _module_game_initialize::
                            161 ;src/game.c:75: scene_game.initialize = game_initialize;
   76E5 21 86 76      [10]  162 	ld	hl, #_game_initialize
   76E8 22 01 88      [16]  163 	ld	(_scene_game), hl
                            164 ;src/game.c:76: scene_game.update = game_update;
   76EB 21 A4 76      [10]  165 	ld	hl, #_game_update
   76EE 22 05 88      [16]  166 	ld	((_scene_game + 0x0004)), hl
                            167 ;src/game.c:77: scene_game.draw = game_draw;
   76F1 21 9E 76      [10]  168 	ld	hl, #_game_draw
   76F4 22 03 88      [16]  169 	ld	((_scene_game + 0x0002)), hl
   76F7 C9            [10]  170 	ret
                            171 ;src/game.c:84: void initialise_level() {
                            172 ;	---------------------------------
                            173 ; Function initialise_level
                            174 ; ---------------------------------
   76F8                     175 _initialise_level::
                            176 ;src/game.c:85: current_level = level_definitions + current_level_num;
   76F8 01 10 77      [10]  177 	ld	bc, #_level_definitions+0
   76FB ED 5B 08 88   [20]  178 	ld	de, (_current_level_num)
   76FF 16 00         [ 7]  179 	ld	d, #0x00
   7701 6B            [ 4]  180 	ld	l, e
   7702 62            [ 4]  181 	ld	h, d
   7703 29            [11]  182 	add	hl, hl
   7704 19            [11]  183 	add	hl, de
   7705 29            [11]  184 	add	hl, hl
   7706 09            [11]  185 	add	hl, bc
   7707 22 0E 88      [16]  186 	ld	(_current_level), hl
                            187 ;src/game.c:86: level_initialize();
   770A CD 06 7A      [17]  188 	call	_level_initialize
                            189 ;src/game.c:87: hud_initialize();
   770D C3 1C 77      [10]  190 	jp  _hud_initialize
                            191 	.area _CODE
                            192 	.area _INITIALIZER
                            193 	.area _CABS (ABS)
