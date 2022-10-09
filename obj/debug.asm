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
;src/debug.c:5: void dbg_displayNumber(int num)
;	---------------------------------
; Function dbg_displayNumber
; ---------------------------------
_dbg_displayNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/debug.c:8: cpct_setDrawCharM0(5, 0);
	ld	hl, #0x0005
	push	hl
	call	_cpct_setDrawCharM0
;src/debug.c:10: for (i = 0; i < 5; i++)
	ld	bc, #0x0000
00102$:
;src/debug.c:12: u8 digit = '0' + (num % 10);
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, l
	add	a, #0x30
	ld	e, a
;src/debug.c:13: cpct_drawCharM0((void *)(LASTDIGIT_VMEM - 4 * i), digit);
	ld	d, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	ld	a, #0x4b
	sub	a, l
	ld	l, a
	ld	a, #0xc0
	sbc	a, h
	ld	h, a
	push	bc
	push	de
	push	hl
	call	_cpct_drawCharM0
	ld	hl, #0x000a
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	pop	bc
	ld	4 (ix), l
	ld	5 (ix), h
;src/debug.c:10: for (i = 0; i < 5; i++)
	inc	bc
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
