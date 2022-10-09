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
                             14 	.globl _level_update
                             15 	.globl _level_draw
                             16 	.globl _level_initialize
                             17 	.globl _cpct_setPALColour
                             18 	.globl _lives_left
                             19 	.globl _current_level_num
                             20 	.globl _current_state
                             21 	.globl _scene_game
                             22 	.globl _module_game_initialize
                             23 	.globl _initialise_level
                             24 ;--------------------------------------------------------
                             25 ; special function registers
                             26 ;--------------------------------------------------------
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DATA
   6D89                      31 _scene_game::
   6D89                      32 	.ds 6
   6D8F                      33 _current_state::
   6D8F                      34 	.ds 1
   6D90                      35 _current_level_num::
   6D90                      36 	.ds 1
   6D91                      37 _lives_left::
   6D91                      38 	.ds 1
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
                             63 ;src/game.c:16: void game_initialize()
                             64 ;	---------------------------------
                             65 ; Function game_initialize
                             66 ; ---------------------------------
   65F8                      67 _game_initialize::
                             68 ;src/game.c:18: current_level_num = 0;
   65F8 21 90 6D      [10]   69 	ld	hl,#_current_level_num + 0
   65FB 36 00         [10]   70 	ld	(hl), #0x00
                             71 ;src/game.c:19: lives_left = 3;
   65FD 21 91 6D      [10]   72 	ld	hl,#_lives_left + 0
   6600 36 03         [10]   73 	ld	(hl), #0x03
                             74 ;src/game.c:20: current_state = Continue;
   6602 21 8F 6D      [10]   75 	ld	hl,#_current_state + 0
   6605 36 00         [10]   76 	ld	(hl), #0x00
                             77 ;src/game.c:21: initialise_level();    
   6607 CD 38 66      [17]   78 	call	_initialise_level
                             79 ;src/game.c:23: cpct_setBorder(HW_LIME);
   660A 21 10 1A      [10]   80 	ld	hl, #0x1a10
   660D E5            [11]   81 	push	hl
   660E CD A6 69      [17]   82 	call	_cpct_setPALColour
   6611 C9            [10]   83 	ret
                             84 ;src/game.c:26: void game_draw()
                             85 ;	---------------------------------
                             86 ; Function game_draw
                             87 ; ---------------------------------
   6612                      88 _game_draw::
                             89 ;src/game.c:28: level_draw();
   6612 C3 07 67      [10]   90 	jp  _level_draw
                             91 ;src/game.c:37: SceneState game_update()
                             92 ;	---------------------------------
                             93 ; Function game_update
                             94 ; ---------------------------------
   6615                      95 _game_update::
                             96 ;src/game.c:41: res = level_update();
   6615 CD 13 67      [17]   97 	call	_level_update
                             98 ;src/game.c:44: if (res == LevelCompleteSuccess) {
                             99 ;src/game.c:46: } else if (res == LevelCompleteFail) {
   6618 7D            [ 4]  100 	ld	a,l
   6619 FE 03         [ 7]  101 	cp	a,#0x03
   661B C8            [11]  102 	ret	Z
   661C D6 02         [ 7]  103 	sub	a, #0x02
   661E C0            [11]  104 	ret	NZ
                            105 ;src/game.c:47: initialise_level();
   661F CD 38 66      [17]  106 	call	_initialise_level
                            107 ;src/game.c:48: res = Continue;
   6622 2E 00         [ 7]  108 	ld	l, #0x00
                            109 ;src/game.c:52: return res;
   6624 C9            [10]  110 	ret
                            111 ;src/game.c:55: void module_game_initialize()
                            112 ;	---------------------------------
                            113 ; Function module_game_initialize
                            114 ; ---------------------------------
   6625                     115 _module_game_initialize::
                            116 ;src/game.c:57: scene_game.initialize = game_initialize;
   6625 21 F8 65      [10]  117 	ld	hl, #_game_initialize
   6628 22 89 6D      [16]  118 	ld	(_scene_game), hl
                            119 ;src/game.c:58: scene_game.update = game_update;
   662B 21 15 66      [10]  120 	ld	hl, #_game_update
   662E 22 8D 6D      [16]  121 	ld	((_scene_game + 0x0004)), hl
                            122 ;src/game.c:59: scene_game.draw = game_draw;
   6631 21 12 66      [10]  123 	ld	hl, #_game_draw
   6634 22 8B 6D      [16]  124 	ld	((_scene_game + 0x0002)), hl
   6637 C9            [10]  125 	ret
                            126 ;src/game.c:62: void initialise_level() {
                            127 ;	---------------------------------
                            128 ; Function initialise_level
                            129 ; ---------------------------------
   6638                     130 _initialise_level::
                            131 ;src/game.c:66: current_level = level_definitions + current_level_num;
   6638 01 4D 66      [10]  132 	ld	bc, #_level_definitions+0
   663B FD 21 90 6D   [14]  133 	ld	iy, #_current_level_num
   663F FD 6E 00      [19]  134 	ld	l, 0 (iy)
   6642 26 00         [ 7]  135 	ld	h, #0x00
   6644 29            [11]  136 	add	hl, hl
   6645 29            [11]  137 	add	hl, hl
   6646 09            [11]  138 	add	hl, bc
   6647 22 92 6D      [16]  139 	ld	(_current_level), hl
                            140 ;src/game.c:67: level_initialize();
   664A C3 E7 66      [10]  141 	jp  _level_initialize
                            142 	.area _CODE
                            143 	.area _INITIALIZER
                            144 	.area _CABS (ABS)
