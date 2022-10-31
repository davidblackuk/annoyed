;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module hud
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _hud_initialize
	.globl _hud_continue_from_death
	.globl _hud_update
	.globl _hud_restore_background
	.globl _hud_draw
	.globl _hud_initialize_internal
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
;src/hud.c:18: void hud_initialize()
;	---------------------------------
; Function hud_initialize
; ---------------------------------
_hud_initialize::
;src/hud.c:20: hud_initialize_internal(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_hud_initialize_internal
	inc	sp
	ret
;src/hud.c:23: void hud_continue_from_death()
;	---------------------------------
; Function hud_continue_from_death
; ---------------------------------
_hud_continue_from_death::
;src/hud.c:25: hud_initialize_internal(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_hud_initialize_internal
	inc	sp
	ret
;src/hud.c:28: void hud_update()
;	---------------------------------
; Function hud_update
; ---------------------------------
_hud_update::
;src/hud.c:30: }
	ret
;src/hud.c:32: void hud_restore_background()
;	---------------------------------
; Function hud_restore_background
; ---------------------------------
_hud_restore_background::
;src/hud.c:34: }
	ret
;src/hud.c:36: void hud_draw()
;	---------------------------------
; Function hud_draw
; ---------------------------------
_hud_draw::
;src/hud.c:38: }
	ret
;src/hud.c:44: void hud_initialize_internal(u8 is_restart)
;	---------------------------------
; Function hud_initialize_internal
; ---------------------------------
_hud_initialize_internal::
	push	ix
	dec	sp
;src/hud.c:46: u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8; 
	ld	hl,#_lives_left + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	dec	hl
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z,00107$
	ld	c, e
	ld	b, d
00107$:
	sra	b
	rr	c
	ld	a, c
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	c, a
	ld	a, #0xc0
	sub	a, c
	ld	c, a
;src/hud.c:48: for (u8 i = 0; i < lives_left; i++)
	ld	b, #0x00
00103$:
	ld	hl, #_lives_left
	ld	a, b
	sub	a, (hl)
	jr	NC,00105$
;src/hud.c:50: u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
	bit	0, b
	jr	NZ,00108$
	ld	d, #0x44
	jr	00109$
00108$:
	ld	d, #0x4a
00109$:
;src/hud.c:51: u8 y = initial_y + ((i / 2) * 8);
	ld	a, b
	srl	a
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	e, a
	add	a,c
;src/hud.c:53: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	de, #0x0605
	push	de
	push	hl
	ld	hl, #_sp_life
	push	hl
	call	_cpct_drawSprite
	pop	bc
;src/hud.c:48: for (u8 i = 0; i < lives_left; i++)
	inc	b
	jr	00103$
00105$:
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
