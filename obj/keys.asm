;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module keys
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _keys_update
	.globl _keys_resetAllKeys
	.globl _keys_initialize
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _key_serve_is_pressed
	.globl _key_right_is_pressed
	.globl _key_left_is_pressed
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_key_left_is_pressed::
	.ds 1
_key_right_is_pressed::
	.ds 1
_key_serve_is_pressed::
	.ds 1
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
;src/keys.c:9: void keys_initialize() {
;	---------------------------------
; Function keys_initialize
; ---------------------------------
_keys_initialize::
;src/keys.c:10: keys_resetAllKeys();    
	jp  _keys_resetAllKeys
;src/keys.c:13: void  keys_resetAllKeys() {
;	---------------------------------
; Function keys_resetAllKeys
; ---------------------------------
_keys_resetAllKeys::
;src/keys.c:14: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
	ld	hl,#_key_serve_is_pressed + 0
	ld	(hl), #0x00
	ld	hl,#_key_right_is_pressed + 0
	ld	(hl), #0x00
	ld	hl,#_key_left_is_pressed + 0
	ld	(hl), #0x00
	ret
;src/keys.c:18: void keys_update() {
;	---------------------------------
; Function keys_update
; ---------------------------------
_keys_update::
;src/keys.c:19: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/keys.c:20: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	iy, #_key_left_is_pressed
	ld	0 (iy), l
;src/keys.c:21: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	iy, #_key_right_is_pressed
	ld	0 (iy), l
;src/keys.c:22: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
	ld	hl, #0x0100
	call	_cpct_isKeyPressed
	ld	iy, #_key_serve_is_pressed
	ld	0 (iy), l
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
