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
	.globl _digits
	.globl _hud_initialize
	.globl _hud_continue_from_death
	.globl _hud_update
	.globl _hud_restore_background
	.globl _hud_draw
	.globl _hud_initialize_internal
	.globl _hud_initialize_static_text
	.globl _hud_draw_score_with_added_last_zero
	.globl _hud_draw_lives
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_digits::
	.ds 20
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
;src/hud.c:32: void hud_initialize()
;	---------------------------------
; Function hud_initialize
; ---------------------------------
_hud_initialize::
;src/hud.c:34: digits[0] = sp_font_00; 
	ld	hl, #_sp_font_00
	ld	(_digits), hl
;src/hud.c:35: digits[1] = sp_font_01; 
	ld	hl, #_sp_font_01
	ld	((_digits + 0x0002)), hl
;src/hud.c:36: digits[2] = sp_font_02; 
	ld	hl, #_sp_font_02
	ld	((_digits + 0x0004)), hl
;src/hud.c:37: digits[3] = sp_font_03; 
	ld	hl, #_sp_font_03
	ld	((_digits + 0x0006)), hl
;src/hud.c:38: digits[4] = sp_font_04; 
	ld	hl, #_sp_font_04
	ld	((_digits + 0x0008)), hl
;src/hud.c:39: digits[5] = sp_font_05; 
	ld	hl, #_sp_font_05
	ld	((_digits + 0x000a)), hl
;src/hud.c:40: digits[6] = sp_font_06; 
	ld	hl, #_sp_font_06
	ld	((_digits + 0x000c)), hl
;src/hud.c:41: digits[7] = sp_font_07; 
	ld	hl, #_sp_font_07
	ld	((_digits + 0x000e)), hl
;src/hud.c:42: digits[8] = sp_font_08; 
	ld	hl, #_sp_font_08
	ld	((_digits + 0x0010)), hl
;src/hud.c:43: digits[9] = sp_font_09; 
	ld	hl, #_sp_font_09
	ld	((_digits + 0x0012)), hl
;src/hud.c:45: hud_initialize_internal(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_hud_initialize_internal
	inc	sp
	ret
;src/hud.c:48: void hud_continue_from_death()
;	---------------------------------
; Function hud_continue_from_death
; ---------------------------------
_hud_continue_from_death::
;src/hud.c:50: hud_initialize_internal(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_hud_initialize_internal
	inc	sp
	ret
;src/hud.c:53: void hud_update()
;	---------------------------------
; Function hud_update
; ---------------------------------
_hud_update::
;src/hud.c:55: }
	ret
;src/hud.c:57: void hud_restore_background()
;	---------------------------------
; Function hud_restore_background
; ---------------------------------
_hud_restore_background::
;src/hud.c:59: }
	ret
;src/hud.c:61: void hud_draw()
;	---------------------------------
; Function hud_draw
; ---------------------------------
_hud_draw::
;src/hud.c:63: }
	ret
;src/hud.c:69: void hud_initialize_internal(u8 is_restart)
;	---------------------------------
; Function hud_initialize_internal
; ---------------------------------
_hud_initialize_internal::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/hud.c:71: u8 initial_y = SCREEN_HEIGHT_ROWS - (((lives_left - 1) / 2) * 8) - 8;
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
	ld	-2 (ix), a
;src/hud.c:73: hud_initialize_static_text();
	call	_hud_initialize_static_text
;src/hud.c:74: hud_draw_score_with_added_last_zero(current_score, HUD_TOP + HUD_TEXT_SPACING);
	ld	a, #0x0b
	push	af
	inc	sp
	ld	hl, (_current_score)
	push	hl
	call	_hud_draw_score_with_added_last_zero
	pop	af
	inc	sp
;src/hud.c:76: hud_draw_score_with_added_last_zero(high_score, HUD_TOP + (HUD_TEXT_SPACING * 5) );
	ld	a, #0x33
	push	af
	inc	sp
	ld	hl, (_high_score)
	push	hl
	call	_hud_draw_score_with_added_last_zero
	pop	af
	inc	sp
;src/hud.c:79: for (u8 i = 0; i < lives_left; i++)
	ld	c, #0x00
00103$:
	ld	hl, #_lives_left
	ld	a, c
	sub	a, (hl)
	jr	NC,00105$
;src/hud.c:81: u8 x = ((i & 1) == 0) ? HUD_LEFT : HUD_LEFT + (SP_LIFE_W + 1);
	bit	0, c
	jr	NZ,00108$
	ld	b, #0x44
	jr	00109$
00108$:
	ld	b, #0x4a
00109$:
;src/hud.c:82: u8 y = initial_y + ((i / 2) * 8);
	ld	a, c
	srl	a
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	e, a
	ld	a, -2 (ix)
	add	a, e
;src/hud.c:84: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	push	bc
	push	af
	inc	sp
	push	bc
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
;src/hud.c:79: for (u8 i = 0; i < lives_left; i++)
	inc	c
	jr	00103$
00105$:
	ld	sp, ix
	pop	ix
	ret
;src/hud.c:89: void hud_initialize_static_text()
;	---------------------------------
; Function hud_initialize_static_text
; ---------------------------------
_hud_initialize_static_text::
;src/hud.c:92: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 1, 1);
	ld	hl, #0x0145
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/hud.c:93: cpct_drawSprite(sp_score, svmem, SP_SCORE_W, SP_SCORE_H);
	ld	hl, #0x070a
	push	hl
	push	bc
	ld	hl, #_sp_score
	push	hl
	call	_cpct_drawSprite
;src/hud.c:96: svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 2, 1 + (3 * HUD_TEXT_SPACING));
	ld	hl, #0x1f46
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/hud.c:97: cpct_drawSprite(sp_high, svmem, SP_HIGH_W, SP_HIGH_H);
	ld	bc, #_sp_high+0
	ld	de, #0x0708
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/hud.c:100: svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 1, 1 + (4 * HUD_TEXT_SPACING));
	ld	hl, #0x2945
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/hud.c:101: cpct_drawSprite(sp_score, svmem, SP_SCORE_W, SP_SCORE_H);
	ld	bc, #0x070a
	push	bc
	push	hl
	ld	hl, #_sp_score
	push	hl
	call	_cpct_drawSprite
;src/hud.c:104: svmem = cpct_getScreenPtr(CPCT_VMEM_START, HUD_LEFT + 1, 1 + (7 * HUD_TEXT_SPACING));
	ld	hl, #0x4745
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/hud.c:105: cpct_drawSprite(sp_level, svmem, SP_LEVEL_W, SP_LEVEL_H);
	ld	bc, #_sp_level+0
	ld	de, #0x070a
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/hud.c:107: hud_draw_lives(1 + (8 * HUD_TEXT_SPACING));
	ld	a, #0x51
	push	af
	inc	sp
	call	_hud_draw_lives
	inc	sp
	ret
;src/hud.c:113: void hud_draw_score_with_added_last_zero(u16 score, u8 row)
;	---------------------------------
; Function hud_draw_score_with_added_last_zero
; ---------------------------------
_hud_draw_score_with_added_last_zero::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/hud.c:116: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 80 - 2, row);
	ld	d, 6 (ix)
	ld	e,#0x4e
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	inc	sp
	inc	sp
;src/hud.c:121: cpct_drawSprite(sp_font_00, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
	ld	c, l
	ld	b, h
	push	bc
	ld	hl, #0x0802
	push	hl
	push	bc
	ld	hl, #_sp_font_00
	push	hl
	call	_cpct_drawSprite
;src/hud.c:124: for (i = 0; i < 5; i++)
	ld	-1 (ix), #0x00
00102$:
;src/hud.c:126: u8 digit =  (score % 10);
	ld	hl, #0x000a
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__moduint
	pop	af
	pop	af
	ld	c, l
;src/hud.c:128: cpct_drawSprite(digits[digit], (svmem - (2 * (i+1))), SP_FONT_CHAR_W, SP_FONT_CHAR_H);
	ld	l, -1 (ix)
	ld	h, #0x00
	inc	hl
	add	hl, hl
	ld	a, -3 (ix)
	sub	a, l
	ld	e, a
	ld	a, -2 (ix)
	sbc	a, h
	ld	d, a
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	ld	bc, #_digits
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
;src/hud.c:129: score /= 10;
	ld	hl, #0x000a
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divuint
	pop	af
	pop	af
	ld	4 (ix), l
	ld	5 (ix), h
;src/hud.c:124: for (i = 0; i < 5; i++)
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x05
	jr	C,00102$
	ld	sp, ix
	pop	ix
	ret
;src/hud.c:135: void hud_draw_lives(u8 row)
;	---------------------------------
; Function hud_draw_lives
; ---------------------------------
_hud_draw_lives::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/hud.c:137: u8 num = current_level_num + 1;
	ld	a,(#_current_level_num + 0)
	inc	a
	ld	-3 (ix), a
;src/hud.c:138: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, 74, row);
	ld	d, 4 (ix)
	ld	e,#0x4a
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	-2 (ix), l
	ld	-1 (ix), h
;src/hud.c:141: u8 digit =  (num % 10);
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, -3 (ix)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	ld	c, l
;src/hud.c:142: cpct_drawSprite(digits[digit], svmem , SP_FONT_CHAR_W, SP_FONT_CHAR_H);
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	ld	bc, #_digits
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
;src/hud.c:144: digit =  ((num / 10) % 10);
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, -3 (ix)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	ld	b, l
	ld	a, #0x0a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	__moduchar
	pop	af
;src/hud.c:145: cpct_drawSprite(digits[digit], svmem - 2 , SP_FONT_CHAR_W, SP_FONT_CHAR_H);
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	dec	de
	dec	de
	ld	h, #0x00
	add	hl, hl
	ld	bc, #_digits
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0802
	push	hl
	push	de
	push	bc
	call	_cpct_drawSprite
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
