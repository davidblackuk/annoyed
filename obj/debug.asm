;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module debug
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _dbg_displayNumber
	.globl _cpct_getScreenPtr
	.globl _cpct_drawCharM0
	.globl _cpct_setDrawCharM0
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
;src/debug.c:5: void dbg_displayNumber(u8 char_row, int num)
;	---------------------------------
; Function dbg_displayNumber
; ---------------------------------
_dbg_displayNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/debug.c:8: u8 *pv = cpct_getScreenPtr(CPCT_VMEM_START,74, char_row * 10);
	ld	a, 4 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ld	b, a
	push	bc
	inc	sp
	ld	a, #0x4a
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	inc	sp
	inc	sp
	push	hl
;src/debug.c:9: cpct_setDrawCharM0(5, 0);
	ld	hl, #0x0005
	push	hl
	call	_cpct_setDrawCharM0
;src/debug.c:11: for (i = 0; i < 5; i++)
	ld	bc, #0x0000
00102$:
;src/debug.c:13: u8 digit = '0' + (num % 10);
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	l,5 (ix)
	ld	h,6 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, l
	add	a, #0x30
	ld	e, a
;src/debug.c:14: cpct_drawCharM0((void *)(pv - 4 * i), digit);
	ld	d, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	ld	a, -2 (ix)
	sub	a, l
	ld	l, a
	ld	a, -1 (ix)
	sbc	a, h
	ld	h, a
	push	bc
	push	de
	push	hl
	call	_cpct_drawCharM0
	ld	hl, #0x000a
	push	hl
	ld	l,5 (ix)
	ld	h,6 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	pop	bc
	ld	5 (ix), l
	ld	6 (ix), h
;src/debug.c:11: for (i = 0; i < 5; i++)
	inc	bc
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
