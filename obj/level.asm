;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module level
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _auto_update
	.globl _auto_initialize
	.globl _keys_update
	.globl _keys_initialize
	.globl _bricks_initialize
	.globl _background_initialize
	.globl _balls_get_first_active
	.globl _balls_draw
	.globl _balls_restore_background
	.globl _balls_update
	.globl _balls_initialize
	.globl _bat_draw
	.globl _bat_restore_background
	.globl _bat_update
	.globl _bat_initialize
	.globl _cpct_memset
	.globl _level_initialize
	.globl _level_draw
	.globl _level_update
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;src/level.c:14: void level_initialize()
;	---------------------------------
; Function level_initialize
; ---------------------------------
_level_initialize::
;src/level.c:16: cpct_clearScreen(AN_PEN_BLACK);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/level.c:18: background_initialize();
	call	_background_initialize
;src/level.c:19: bricks_initialize();
	call	_bricks_initialize
;src/level.c:20: auto_initialize();
	call	_auto_initialize
;src/level.c:22: keys_initialize();
	call	_keys_initialize
;src/level.c:23: bat_initialize();
	call	_bat_initialize
;src/level.c:24: balls_initialize();
	call	_balls_initialize
	ret
;src/level.c:27: void level_draw()
;	---------------------------------
; Function level_draw
; ---------------------------------
_level_draw::
;src/level.c:30: bat_restore_background();
	call	_bat_restore_background
;src/level.c:31: balls_restore_background();
	call	_balls_restore_background
;src/level.c:34: bat_draw();
	call	_bat_draw
;src/level.c:35: balls_draw();
	jp  _balls_draw
;src/level.c:38: SceneState level_update()
;	---------------------------------
; Function level_update
; ---------------------------------
_level_update::
	dec	sp
;src/level.c:40: SceneState res = Continue;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x00
;src/level.c:41: keys_update();
	call	_keys_update
;src/level.c:42: auto_update();
	call	_auto_update
;src/level.c:43: bat_update();
	call	_bat_update
;src/level.c:44: balls_update();
	call	_balls_update
;src/level.c:47: if (balls_get_first_active() == NULL) {
	call	_balls_get_first_active
	ld	a, h
	or	a,l
	jr	NZ,00102$
;src/level.c:48: res = LevelCompleteFail;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x02
00102$:
;src/level.c:51: return res;
	ld	iy, #0
	add	iy, sp
	ld	l, 0 (iy)
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
