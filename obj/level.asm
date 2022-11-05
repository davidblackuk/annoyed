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
	.globl _blocks_restore_background
	.globl _blocks_draw
	.globl _blocks_initialize
	.globl _background_initialize
	.globl _bat_draw
	.globl _bat_restore_background
	.globl _bat_update
	.globl _bat_initialize
	.globl _balls_get_first_active
	.globl _balls_draw
	.globl _balls_restore_background
	.globl _balls_update
	.globl _balls_initialize
	.globl _cpct_memset
	.globl _level_initialize
	.globl _level_continue_from_death
	.globl _level_draw
	.globl _level_update
	.globl _level_initialize_internal
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
;src/level.c:27: void level_initialize()
;	---------------------------------
; Function level_initialize
; ---------------------------------
_level_initialize::
;src/level.c:29: level_initialize_internal(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_level_initialize_internal
	inc	sp
	ret
;src/level.c:33: void level_continue_from_death()
;	---------------------------------
; Function level_continue_from_death
; ---------------------------------
_level_continue_from_death::
;src/level.c:35: level_initialize_internal(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_level_initialize_internal
	inc	sp
	ret
;src/level.c:38: void level_draw()
;	---------------------------------
; Function level_draw
; ---------------------------------
_level_draw::
;src/level.c:41: bat_restore_background();
	call	_bat_restore_background
;src/level.c:42: balls_restore_background();
	call	_balls_restore_background
;src/level.c:43: blocks_restore_background();
	call	_blocks_restore_background
;src/level.c:46: blocks_draw();
	call	_blocks_draw
;src/level.c:47: bat_draw();
	call	_bat_draw
;src/level.c:48: balls_draw();
	jp  _balls_draw
;src/level.c:51: SceneState level_update()
;	---------------------------------
; Function level_update
; ---------------------------------
_level_update::
	dec	sp
;src/level.c:54: SceneState res = Continue;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x00
;src/level.c:56: do
00101$:
;src/level.c:58: keys_update();
	call	_keys_update
;src/level.c:59: } while (key_pause_is_pressed);
	ld	a,(#_key_pause_is_pressed + 0)
	or	a, a
	jr	NZ,00101$
;src/level.c:61: auto_update();
	call	_auto_update
;src/level.c:62: bat_update();
	call	_bat_update
;src/level.c:63: balls_update();
	call	_balls_update
;src/level.c:66: if (balls_get_first_active() == NULL)
	call	_balls_get_first_active
	ld	a, h
	or	a,l
	jr	NZ,00105$
;src/level.c:68: res = LevelCompleteFail;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x02
00105$:
;src/level.c:70: if (blocks_remaining == 0)
	ld	iy, #_blocks_remaining
	ld	a, 1 (iy)
	or	a,0 (iy)
	jr	NZ,00107$
;src/level.c:72: res = LevelCompleteSuccess;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x03
00107$:
;src/level.c:75: return res;
	ld	iy, #0
	add	iy, sp
	ld	l, 0 (iy)
	inc	sp
	ret
;src/level.c:82: void level_initialize_internal(u8 is_restart)
;	---------------------------------
; Function level_initialize_internal
; ---------------------------------
_level_initialize_internal::
;src/level.c:84: cpct_clearScreen(AN_PEN_BLACK);
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
;src/level.c:86: background_initialize();
	call	_background_initialize
;src/level.c:87: blocks_initialize(is_restart);
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_blocks_initialize
	inc	sp
;src/level.c:88: auto_initialize();
	call	_auto_initialize
;src/level.c:90: keys_initialize();
	call	_keys_initialize
;src/level.c:91: bat_initialize();
	call	_bat_initialize
;src/level.c:92: balls_initialize();
	call	_balls_initialize
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
