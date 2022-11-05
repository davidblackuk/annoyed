;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _initializeCpc
	.globl _module_menu_initialize
	.globl _module_game_initialize
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_disableFirmware
	.globl _play_scene
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
;src/main.c:21: void initializeCpc()
;	---------------------------------
; Function initializeCpc
; ---------------------------------
_initializeCpc::
;src/main.c:25: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:27: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:31: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:33: cpct_setPalette((u8 *)g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:36: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:38: high_score = 1000;
	ld	hl, #0x03e8
	ld	(_high_score), hl
;src/main.c:39: initializeCpc();
	call	_initializeCpc
;src/main.c:40: module_menu_initialize();
	call	_module_menu_initialize
;src/main.c:41: module_game_initialize();
	call	_module_game_initialize
;src/main.c:43: while (1)
00102$:
;src/main.c:45: play_scene(&scene_menu);
	ld	hl, #_scene_menu
	push	hl
	call	_play_scene
;src/main.c:46: play_scene(&scene_game);
	ld	hl, #_scene_game
	ex	(sp),hl
	call	_play_scene
	pop	af
	jr	00102$
;src/main.c:54: void play_scene(Scene *scene)
;	---------------------------------
; Function play_scene
; ---------------------------------
_play_scene::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:58: scene->initialize();
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	push	bc
	ld	l, e
	call	___sdcc_call_hl
	pop	bc
;src/main.c:60: do
	inc	sp
	inc	sp
	push	bc
00102$:
;src/main.c:65: cpct_waitVSYNC();
	push	bc
	call	_cpct_waitVSYNC
	pop	bc
;src/main.c:67: scene->draw();
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	push	bc
	ld	l, e
	call	___sdcc_call_hl
	pop	bc
;src/main.c:68: state = scene->update();
	ld	l, c
	ld	h, b
	ld	de, #0x0004
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	push	bc
	ld	l, e
	call	___sdcc_call_hl
	pop	bc
;src/main.c:73: for (i16 i = 0; i < t; i++)
	ld	de, #0x0000
00106$:
	ld	a, e
	sub	a, #0x05
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00103$
	inc	de
	jr	00106$
00103$:
;src/main.c:79: } while (state == Continue);
	ld	a, l
	or	a, a
	jr	Z,00102$
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)