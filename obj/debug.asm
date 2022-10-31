;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module debug
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_getScreenPtr
	.globl _cpct_drawCharM0
	.globl _cpct_setDrawCharM0
	.globl _dbg_displayNumber
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
;src/debug.c:4: void dbg_displayNumber(u8 char_row, i16 num)
;	---------------------------------
; Function dbg_displayNumber
; ---------------------------------
_dbg_displayNumber::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;src/debug.c:7: u8 negative  = 0;
	ld	-1 (ix), #0x00
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
;src/debug.c:10: if (num < 0){
	bit	7, 6 (ix)
	jr	Z,00102$
;src/debug.c:11: negative = 1;
	ld	-1 (ix), #0x01
;src/debug.c:12: num = -num;
	xor	a, a
	sub	a, 5 (ix)
	ld	5 (ix), a
	ld	a, #0x00
	sbc	a, 6 (ix)
	ld	6 (ix), a
;src/debug.c:14: cpct_setDrawCharM0(AN_PEN_BRIGHT_RED, AN_PEN_ORANGE);
	ld	hl, #0x0205
	push	hl
	call	_cpct_setDrawCharM0
	jr	00112$
00102$:
;src/debug.c:16: cpct_setDrawCharM0(AN_PEN_SKY_BLUE, AN_PEN_BLUE);
	ld	hl, #0x0a06
	push	hl
	call	_cpct_setDrawCharM0
;src/debug.c:21: for (i = 0; i < 5; i++)
00112$:
	ld	bc, #0x0000
00107$:
;src/debug.c:23: u8 digit = '0' + (num % 10);
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
;src/debug.c:24: cpct_drawCharM0((void *)(pv - 4 * i), digit);
	ld	d, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	ld	a, -3 (ix)
	sub	a, l
	ld	l, a
	ld	a, -2 (ix)
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
;src/debug.c:21: for (i = 0; i < 5; i++)
	inc	bc
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00107$
;src/debug.c:27: if (negative){
	ld	a, -1 (ix)
	or	a, a
	jr	Z,00109$
;src/debug.c:28: cpct_drawCharM0((void *)(pv - 20), '-');
	ld	a, -3 (ix)
	add	a, #0xec
	ld	c, a
	ld	a, -2 (ix)
	adc	a, #0xff
	ld	b, a
	ld	hl, #0x002d
	push	hl
	push	bc
	call	_cpct_drawCharM0
00109$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
