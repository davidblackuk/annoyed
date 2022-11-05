;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module text
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strlen
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _text_write_centered_string
	.globl _text_write_string
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
;src/text.c:7: void text_write_centered_string(u8 y, char * text) {
;	---------------------------------
; Function text_write_centered_string
; ---------------------------------
_text_write_centered_string::
;src/text.c:10: u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * 2) / 2;
	ld	hl, #3
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strlen
	pop	af
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a, #0x50
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	srl	b
	rr	c
	ld	b, c
;src/text.c:11: text_write_string(x, y, text);
	ld	hl, #3
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_text_write_string
	pop	af
	pop	af
	ret
;src/text.c:15: void text_write_string(u8 x, u8 y, char * text) {
;	---------------------------------
; Function text_write_string
; ---------------------------------
_text_write_string::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
;src/text.c:16: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	-3 (ix), l
	ld	-2 (ix), h
;src/text.c:20: while (*text) {
	ld	a, 6 (ix)
	ld	-5 (ix), a
	ld	a, 7 (ix)
	ld	-4 (ix), a
00125$:
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z, 00128$
;src/text.c:21: charsprite = 0;
	ld	hl, #0x0000
	ex	(sp), hl
;src/text.c:23: index = (*text) - '0'; 
	ld	c, -1 (ix)
;src/text.c:22: if (*text >= '0' && *text <= '9') {
	ld	a, -1 (ix)
	sub	a, #0x30
	jr	C,00120$
	ld	a, #0x39
	sub	a, -1 (ix)
	jr	C,00120$
;src/text.c:23: index = (*text) - '0'; 
	ld	a, c
	add	a, #0xd0
	ld	l, a
;src/text.c:24: charsprite = sp_font_00 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));           
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_sp_font_00
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	jp	00121$
00120$:
;src/text.c:25: } else if (*text >= 'A' && *text <= 'Z') {
	ld	a, -1 (ix)
	sub	a, #0x41
	jr	C,00116$
	ld	a, #0x5a
	sub	a, -1 (ix)
	jr	C,00116$
;src/text.c:26: index = (*text) - 'A'; 
	ld	a, c
	add	a, #0xbf
	ld	l, a
;src/text.c:27: charsprite = sp_font_10 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));           
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #_sp_font_10
	add	hl, de
	inc	sp
	inc	sp
	push	hl
	jr	00121$
00116$:
;src/text.c:29: } else if (*text == ':') {
	ld	a, -1 (ix)
	sub	a, #0x3a
	jr	NZ,00113$
;src/text.c:30: charsprite = sp_font_36;                       
	ld	-7 (ix), #<(_sp_font_36)
	ld	-6 (ix), #>(_sp_font_36)
	jr	00121$
00113$:
;src/text.c:31: } else if (*text == '?') {
	ld	a, -1 (ix)
	sub	a, #0x3f
	jr	NZ,00110$
;src/text.c:32: charsprite = sp_font_37;                       
	ld	-7 (ix), #<(_sp_font_37)
	ld	-6 (ix), #>(_sp_font_37)
	jr	00121$
00110$:
;src/text.c:33: } else if (*text == ' ') {
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	NZ,00107$
;src/text.c:34: charsprite = sp_font_38;                       
	ld	-7 (ix), #<(_sp_font_38)
	ld	-6 (ix), #>(_sp_font_38)
	jr	00121$
00107$:
;src/text.c:35: } else if (*text == '.') {
	ld	a, -1 (ix)
	sub	a, #0x2e
	jr	NZ,00104$
;src/text.c:36: charsprite = sp_font_39;                       
	ld	-7 (ix), #<(_sp_font_39)
	ld	-6 (ix), #>(_sp_font_39)
	jr	00121$
00104$:
;src/text.c:37: } else if (*text == ',') {
	ld	a, -1 (ix)
	sub	a, #0x2c
	jr	NZ,00121$
;src/text.c:38: charsprite = sp_font_40;                       
	ld	-7 (ix), #<(_sp_font_40)
	ld	-6 (ix), #>(_sp_font_40)
00121$:
;src/text.c:41: if (charsprite != 0) {
	ld	a, -6 (ix)
	or	a,-7 (ix)
	jr	Z,00124$
;src/text.c:42: cpct_drawSprite(charsprite, svmem , SP_FONT_CHAR_W, SP_FONT_CHAR_H);
	ld	c,-3 (ix)
	ld	b,-2 (ix)
	pop	de
	push	de
	ld	hl, #0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSprite
00124$:
;src/text.c:45: text++;
	inc	-5 (ix)
	jr	NZ,00189$
	inc	-4 (ix)
00189$:
;src/text.c:46: svmem += 2;
	ld	a, -3 (ix)
	add	a, #0x02
	ld	-3 (ix), a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	jp	00125$
00128$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
