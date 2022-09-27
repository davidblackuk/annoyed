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
	.globl _initializeBackground
	.globl _initializeBat
	.globl _updateBat
	.globl _drawBat
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
	.globl _cpct_scanKeyboard_f
	.globl _cpct_disableFirmware
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
;src/main.c:12: void initializeCpc() {
;	---------------------------------
; Function initializeCpc
; ---------------------------------
_initializeCpc::
;src/main.c:15: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:18: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:20: cpct_setBorder(HW_BRIGHT_YELLOW);
	ld	hl, #0x0a10
	push	hl
	call	_cpct_setPALColour
;src/main.c:22: cpct_setPalette(g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:27: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:29: initializeCpc();
	call	_initializeCpc
;src/main.c:31: initializeBackground();
	call	_initializeBackground
;src/main.c:32: initializeBat();
	call	_initializeBat
;src/main.c:34: while (1) {
00102$:
;src/main.c:37: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:39: updateBat();
	call	_updateBat
;src/main.c:40: drawBat();
	call	_drawBat
;src/main.c:42: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
