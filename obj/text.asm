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
;src/text.c:19: void text_write_centered_string(u8 y, char *text)
;	---------------------------------
; Function text_write_centered_string
; ---------------------------------
_text_write_centered_string::
;src/text.c:21: u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * SP_FONT_CHAR_W) / 2;
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
;src/text.c:22: text_write_string(x, y, text);
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
;src/text.c:25: void text_write_string(u8 x, u8 y, char *text)
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
;src/text.c:27: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	-5 (ix), l
	ld	-4 (ix), h
;src/text.c:31: while (*text)
	ld	a, 6 (ix)
	ld	-3 (ix), a
	ld	a, 7 (ix)
	ld	-2 (ix), a
00117$:
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
	or	a, a
	jp	Z, 00120$
;src/text.c:33: charsprite = 0;
	ld	hl, #0x0000
	ex	(sp), hl
;src/text.c:36: index = (*text) - '0';
	ld	c, -1 (ix)
;src/text.c:34: if (*text >= '0' && *text <= '9')
	ld	a, -1 (ix)
	sub	a, #0x30
	jr	C,00112$
	ld	a, #0x39
	sub	a, -1 (ix)
	jr	C,00112$
;src/text.c:36: index = (*text) - '0';
	ld	a, c
	add	a, #0xd0
	ld	l, a
;src/text.c:37: charsprite = sp_font_00 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
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
	jp	00113$
00112$:
;src/text.c:39: else if (*text >= 'A' && *text <= 'Z')
	ld	a, -1 (ix)
	sub	a, #0x41
	jr	C,00108$
	ld	a, #0x5a
	sub	a, -1 (ix)
	jr	C,00108$
;src/text.c:41: index = (*text) - 'A';
	ld	a, c
	add	a, #0xbf
	ld	l, a
;src/text.c:42: charsprite = sp_font_10 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
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
	jr	00113$
00108$:
;src/text.c:46: switch (*text)
	ld	a, -1 (ix)
	sub	a, #0x20
	jr	Z,00103$
	ld	a, -1 (ix)
	sub	a, #0x2c
	jr	Z,00105$
	ld	a, -1 (ix)
	sub	a, #0x2e
	jr	Z,00104$
	ld	a, -1 (ix)
	sub	a, #0x3a
	jr	Z,00101$
	ld	a, -1 (ix)
	sub	a, #0x3f
	jr	Z,00102$
	jr	00113$
;src/text.c:48: case ':':
00101$:
;src/text.c:49: charsprite = sp_font_36;
	ld	-7 (ix), #<(_sp_font_36)
	ld	-6 (ix), #>(_sp_font_36)
;src/text.c:50: break;
	jr	00113$
;src/text.c:51: case '?':
00102$:
;src/text.c:52: charsprite = sp_font_37;
	ld	-7 (ix), #<(_sp_font_37)
	ld	-6 (ix), #>(_sp_font_37)
;src/text.c:53: break;
	jr	00113$
;src/text.c:54: case ' ':
00103$:
;src/text.c:55: charsprite = sp_font_38;
	ld	-7 (ix), #<(_sp_font_38)
	ld	-6 (ix), #>(_sp_font_38)
;src/text.c:56: break;
	jr	00113$
;src/text.c:57: case '.':
00104$:
;src/text.c:58: charsprite = sp_font_39;
	ld	-7 (ix), #<(_sp_font_39)
	ld	-6 (ix), #>(_sp_font_39)
;src/text.c:59: break;
	jr	00113$
;src/text.c:60: case ',':
00105$:
;src/text.c:61: charsprite = sp_font_40;
	ld	-7 (ix), #<(_sp_font_40)
	ld	-6 (ix), #>(_sp_font_40)
;src/text.c:63: }
00113$:
;src/text.c:66: if (charsprite != 0)
	ld	a, -6 (ix)
	or	a,-7 (ix)
	jr	Z,00116$
;src/text.c:68: cpct_drawSprite(charsprite, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
	pop	de
	pop	bc
	push	bc
	push	de
	pop	de
	push	de
	ld	hl, #0x0802
	push	hl
	push	bc
	push	de
	call	_cpct_drawSprite
00116$:
;src/text.c:71: text++;
	inc	-3 (ix)
	jr	NZ,00176$
	inc	-2 (ix)
00176$:
;src/text.c:72: svmem += 2;
	ld	a, -5 (ix)
	add	a, #0x02
	ld	-5 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
	jp	00117$
00120$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
