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
   75B5                      31 _scene_game::
   75B5                      32 	.ds 6
   75BB                      33 _current_state::
   75BB                      34 	.ds 1
   75BC                      35 _current_level_num::
   75BC                      36 	.ds 1
   75BD                      37 _lives_left::
   75BD                      38 	.ds 1
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
   6A99                      67 _game_initialize::
                             68 ;src/game.c:18: current_level_num = 1;
   6A99 21 BC 75      [10]   69 	ld	hl,#_current_level_num + 0
   6A9C 36 01         [10]   70 	ld	(hl), #0x01
                             71 ;src/game.c:19: lives_left = 3;
   6A9E 21 BD 75      [10]   72 	ld	hl,#_lives_left + 0
   6AA1 36 03         [10]   73 	ld	(hl), #0x03
                             74 ;src/game.c:20: current_state = Continue;
   6AA3 21 BB 75      [10]   75 	ld	hl,#_current_state + 0
   6AA6 36 00         [10]   76 	ld	(hl), #0x00
                             77 ;src/game.c:21: initialise_level();    
   6AA8 CD D9 6A      [17]   78 	call	_initialise_level
                             79 ;src/game.c:23: cpct_setBorder(HW_LIME);
   6AAB 21 10 1A      [10]   80 	ld	hl, #0x1a10
   6AAE E5            [11]   81 	push	hl
   6AAF CD 4F 6E      [17]   82 	call	_cpct_setPALColour
   6AB2 C9            [10]   83 	ret
                             84 ;src/game.c:26: void game_draw()
                             85 ;	---------------------------------
                             86 ; Function game_draw
                             87 ; ---------------------------------
   6AB3                      88 _game_draw::
                             89 ;src/game.c:28: level_draw();
   6AB3 C3 AC 6B      [10]   90 	jp  _level_draw
                             91 ;src/game.c:37: SceneState game_update()
                             92 ;	---------------------------------
                             93 ; Function game_update
                             94 ; ---------------------------------
   6AB6                      95 _game_update::
                             96 ;src/game.c:41: res = level_update();
   6AB6 CD BE 6B      [17]   97 	call	_level_update
                             98 ;src/game.c:44: if (res == LevelCompleteSuccess) {
                             99 ;src/game.c:46: } else if (res == LevelCompleteFail) {
   6AB9 7D            [ 4]  100 	ld	a,l
   6ABA FE 03         [ 7]  101 	cp	a,#0x03
   6ABC C8            [11]  102 	ret	Z
   6ABD D6 02         [ 7]  103 	sub	a, #0x02
   6ABF C0            [11]  104 	ret	NZ
                            105 ;src/game.c:47: initialise_level();
   6AC0 CD D9 6A      [17]  106 	call	_initialise_level
                            107 ;src/game.c:48: res = Continue;
   6AC3 2E 00         [ 7]  108 	ld	l, #0x00
                            109 ;src/game.c:52: return res;
   6AC5 C9            [10]  110 	ret
                            111 ;src/game.c:55: void module_game_initialize()
                            112 ;	---------------------------------
                            113 ; Function module_game_initialize
                            114 ; ---------------------------------
   6AC6                     115 _module_game_initialize::
                            116 ;src/game.c:57: scene_game.initialize = game_initialize;
   6AC6 21 99 6A      [10]  117 	ld	hl, #_game_initialize
   6AC9 22 B5 75      [16]  118 	ld	(_scene_game), hl
                            119 ;src/game.c:58: scene_game.update = game_update;
   6ACC 21 B6 6A      [10]  120 	ld	hl, #_game_update
   6ACF 22 B9 75      [16]  121 	ld	((_scene_game + 0x0004)), hl
                            122 ;src/game.c:59: scene_game.draw = game_draw;
   6AD2 21 B3 6A      [10]  123 	ld	hl, #_game_draw
   6AD5 22 B7 75      [16]  124 	ld	((_scene_game + 0x0002)), hl
   6AD8 C9            [10]  125 	ret
                            126 ;src/game.c:62: void initialise_level() {
                            127 ;	---------------------------------
                            128 ; Function initialise_level
                            129 ; ---------------------------------
   6AD9                     130 _initialise_level::
                            131 ;src/game.c:66: current_level = level_definitions + current_level_num;
   6AD9 01 EE 6A      [10]  132 	ld	bc, #_level_definitions+0
   6ADC ED 5B BC 75   [20]  133 	ld	de, (_current_level_num)
   6AE0 16 00         [ 7]  134 	ld	d, #0x00
   6AE2 6B            [ 4]  135 	ld	l, e
   6AE3 62            [ 4]  136 	ld	h, d
   6AE4 29            [11]  137 	add	hl, hl
   6AE5 19            [11]  138 	add	hl, de
   6AE6 29            [11]  139 	add	hl, hl
   6AE7 09            [11]  140 	add	hl, bc
   6AE8 22 BE 75      [16]  141 	ld	(_current_level), hl
                            142 ;src/game.c:67: level_initialize();
   6AEB C3 8C 6B      [10]  143 	jp  _level_initialize
                            144 	.area _CODE
                            145 	.area _INITIALIZER
                            146 	.area _CABS (ABS)
