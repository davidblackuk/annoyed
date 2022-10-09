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
;src/main.c:15: void initializeCpc()
;	---------------------------------
; Function initializeCpc
; ---------------------------------
_initializeCpc::
;src/main.c:19: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:21: cpct_setBorder(HW_BLACK);
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/main.c:25: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:27: cpct_setPalette((u8 *)g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:32: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:35: initializeCpc();
	call	_initializeCpc
;src/main.c:36: module_menu_initialize();
	call	_module_menu_initialize
;src/main.c:37: module_game_initialize();
	call	_module_game_initialize
;src/main.c:40: while (1) {
00102$:
;src/main.c:41: play_scene(&scene_menu);   
	ld	hl, #_scene_menu
	push	hl
	call	_play_scene
;src/main.c:42: play_scene(&scene_game);   
	ld	hl, #_scene_game
	ex	(sp),hl
	call	_play_scene
	pop	af
	jr	00102$
;src/main.c:47: void play_scene(Scene *scene) {
;	---------------------------------
; Function play_scene
; ---------------------------------
_play_scene::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:50: scene->initialize();
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	push	de
	ld	l, c
	call	___sdcc_call_hl
	pop	de
;src/main.c:52: do
	ld	c, e
	ld	b, d
00101$:
;src/main.c:57: cpct_waitVSYNC();
	push	bc
	push	de
	call	_cpct_waitVSYNC
	pop	de
	pop	bc
;src/main.c:59: scene->draw();
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	call	___sdcc_call_hl
	pop	de
	pop	bc
;src/main.c:60: state = scene->update();
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	push	de
	call	___sdcc_call_hl
	pop	de
	pop	bc
;src/main.c:62: } while (state == Continue);
	ld	a, l
	or	a, a
	jr	Z,00101$
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
