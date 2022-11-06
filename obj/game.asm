;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _game_update
	.globl _game_draw
	.globl _game_initialize
	.globl _hud_draw
	.globl _hud_update
	.globl _hud_continue_from_death
	.globl _hud_initialize
	.globl _level_update
	.globl _level_draw
	.globl _level_continue_from_death
	.globl _level_initialize
	.globl _high_score
	.globl _current_score
	.globl _lives_left
	.globl _current_level_num
	.globl _current_state
	.globl _scene_game
	.globl _module_game_initialize
	.globl _initialise_level
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scene_game::
	.ds 6
_current_state::
	.ds 1
_current_level_num::
	.ds 1
_lives_left::
	.ds 1
_current_score::
	.ds 2
_high_score::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/game.c:26: void game_initialize()
;	---------------------------------
; Function game_initialize
; ---------------------------------
_game_initialize::
;src/game.c:28: current_level_num = 2;
	ld	hl,#_current_level_num + 0
	ld	(hl), #0x02
;src/game.c:29: current_score = 0;
	ld	hl, #0x0000
	ld	(_current_score), hl
;src/game.c:30: lives_left = INITIAL_LIVES;
	ld	hl,#_lives_left + 0
	ld	(hl), #0x04
;src/game.c:31: current_state = Continue;
	ld	hl,#_current_state + 0
	ld	(hl), #0x00
;src/game.c:32: initialise_level();    
	jp  _initialise_level
;src/game.c:35: void game_draw()
;	---------------------------------
; Function game_draw
; ---------------------------------
_game_draw::
;src/game.c:37: level_draw();
	call	_level_draw
;src/game.c:39: hud_draw();
	jp  _hud_draw
;src/game.c:43: SceneState game_update()
;	---------------------------------
; Function game_update
; ---------------------------------
_game_update::
;src/game.c:47: res = level_update();
	call	_level_update
;src/game.c:48: hud_update();
	push	hl
	call	_hud_update
	pop	hl
;src/game.c:51: if (res == LevelCompleteSuccess) {
	ld	a, l
	sub	a, #0x03
	jr	NZ,00108$
;src/game.c:52: current_level_num += 1;
	ld	iy, #_current_level_num
	inc	0 (iy)
;src/game.c:53: if (current_level_num >= NUM_LEVELS) {
	ld	a, 0 (iy)
	sub	a, #0x03
	jr	C,00102$
;src/game.c:54: return GameOver;
	ld	l, #0x04
	ret
00102$:
;src/game.c:56: initialise_level();
	call	_initialise_level
;src/game.c:57: res = Continue;
	ld	l, #0x00
	ret
00108$:
;src/game.c:59: } else if (res == LevelCompleteFail) {
	ld	a, l
	sub	a, #0x02
	ret	NZ
;src/game.c:60: lives_left -= 1;
	ld	iy, #_lives_left
	dec	0 (iy)
;src/game.c:61: if (lives_left == 0) {
	ld	a, 0 (iy)
	or	a, a
	jr	NZ,00104$
;src/game.c:62: return GameOver;
	ld	l, #0x04
	ret
00104$:
;src/game.c:64: level_continue_from_death();
	call	_level_continue_from_death
;src/game.c:65: hud_continue_from_death();
	call	_hud_continue_from_death
;src/game.c:66: res = Continue;
	ld	l, #0x00
;src/game.c:70: return res;
	ret
;src/game.c:73: void module_game_initialize()
;	---------------------------------
; Function module_game_initialize
; ---------------------------------
_module_game_initialize::
;src/game.c:75: scene_game.initialize = game_initialize;
	ld	hl, #_game_initialize
	ld	(_scene_game), hl
;src/game.c:76: scene_game.update = game_update;
	ld	hl, #_game_update
	ld	((_scene_game + 0x0004)), hl
;src/game.c:77: scene_game.draw = game_draw;
	ld	hl, #_game_draw
	ld	((_scene_game + 0x0002)), hl
	ret
;src/game.c:84: void initialise_level() {
;	---------------------------------
; Function initialise_level
; ---------------------------------
_initialise_level::
;src/game.c:85: current_level = level_definitions + current_level_num;
	ld	bc, #_level_definitions+0
	ld	de, (_current_level_num)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, bc
	ld	(_current_level), hl
;src/game.c:86: level_initialize();
	call	_level_initialize
;src/game.c:87: hud_initialize();
	jp  _hud_initialize
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
