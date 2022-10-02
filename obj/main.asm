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
	.globl _keys_update
	.globl _keys_initialize
	.globl _initializeBackground
	.globl _balls_draw
	.globl _balls_update
	.globl _balls_initialize
	.globl _bat_draw
	.globl _bat_restore_background
	.globl _bat_update
	.globl _bat_initialize
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _cpct_waitVSYNC
	.globl _cpct_setVideoMode
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
;src/main.c:14: void initializeCpc() {
;	---------------------------------
; Function initializeCpc
; ---------------------------------
_initializeCpc::
;src/main.c:17: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:20: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:22: cpct_setBorder(HW_BRIGHT_YELLOW);
	ld	hl, #0x0a10
	push	hl
	call	_cpct_setPALColour
;src/main.c:24: cpct_setPalette((u8*)g_palette, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_g_palette
	push	hl
	call	_cpct_setPalette
	ret
;src/main.c:28: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:30: initializeCpc();
	call	_initializeCpc
;src/main.c:32: initializeBackground();
	call	_initializeBackground
;src/main.c:34: auto_initialize();
	call	_auto_initialize
;src/main.c:35: keys_initialize();
	call	_keys_initialize
;src/main.c:36: bat_initialize();
	call	_bat_initialize
;src/main.c:37: balls_initialize();
	call	_balls_initialize
;src/main.c:39: while (1) {
00102$:
;src/main.c:43: cpct_waitVSYNC();
	call	_cpct_waitVSYNC
;src/main.c:46: bat_restore_background();
	call	_bat_restore_background
;src/main.c:47: balls_restore_background();
	call	_balls_restore_background
;src/main.c:50: bat_draw();
	call	_bat_draw
;src/main.c:51: balls_draw();
	call	_balls_draw
;src/main.c:54: keys_update();
	call	_keys_update
;src/main.c:55: auto_update();
	call	_auto_update
;src/main.c:56: bat_update();
	call	_bat_update
;src/main.c:57: balls_update();
	call	_balls_update
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
