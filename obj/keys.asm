;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module keys
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_isAnyKeyPressed_f
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _key_pause_is_pressed
	.globl _key_any_is_pressed
	.globl _key_auto_is_pressed
	.globl _key_serve_is_pressed
	.globl _key_right_is_pressed
	.globl _key_left_is_pressed
	.globl _keys_initialize
	.globl _keys_resetAllKeys
	.globl _keys_update
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
_key_auto_is_pressed::
	.ds 1
_key_any_is_pressed::
	.ds 1
_key_pause_is_pressed::
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
;src/keys.c:21: void keys_initialize()
;	---------------------------------
; Function keys_initialize
; ---------------------------------
_keys_initialize::
;src/keys.c:23: keys_resetAllKeys();
	jp  _keys_resetAllKeys
;src/keys.c:26: void keys_resetAllKeys()
;	---------------------------------
; Function keys_resetAllKeys
; ---------------------------------
_keys_resetAllKeys::
;src/keys.c:28: key_left_is_pressed = key_right_is_pressed = key_serve_is_pressed = 0;
	ld	hl,#_key_serve_is_pressed + 0
	ld	(hl), #0x00
	ld	hl,#_key_right_is_pressed + 0
	ld	(hl), #0x00
	ld	hl,#_key_left_is_pressed + 0
	ld	(hl), #0x00
;src/keys.c:29: key_auto_is_pressed = key_any_is_pressed = 0;
	ld	hl,#_key_any_is_pressed + 0
	ld	(hl), #0x00
	ld	hl,#_key_auto_is_pressed + 0
	ld	(hl), #0x00
	ret
;src/keys.c:33: void keys_update()
;	---------------------------------
; Function keys_update
; ---------------------------------
_keys_update::
;src/keys.c:35: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/keys.c:36: key_left_is_pressed = cpct_isKeyPressed(Key_CursorLeft);
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	iy, #_key_left_is_pressed
	ld	0 (iy), l
;src/keys.c:37: key_left_is_pressed |= cpct_isKeyPressed(Key_A);
	ld	hl, #0x2008
	call	_cpct_isKeyPressed
	ld	a, l
	ld	iy, #_key_left_is_pressed
	or	a, 0 (iy)
	ld	0 (iy), a
;src/keys.c:39: key_right_is_pressed = cpct_isKeyPressed(Key_CursorRight);
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	iy, #_key_right_is_pressed
	ld	0 (iy), l
;src/keys.c:40: key_right_is_pressed |= cpct_isKeyPressed(Key_D);
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	ld	iy, #_key_right_is_pressed
	or	a, 0 (iy)
	ld	0 (iy), a
;src/keys.c:42: key_serve_is_pressed = cpct_isKeyPressed(Key_CursorUp);
	ld	hl, #0x0100
	call	_cpct_isKeyPressed
	ld	iy, #_key_serve_is_pressed
	ld	0 (iy), l
;src/keys.c:43: key_serve_is_pressed |= cpct_isKeyPressed(Key_W);
	ld	hl, #0x0807
	call	_cpct_isKeyPressed
	ld	a, l
	ld	iy, #_key_serve_is_pressed
	or	a, 0 (iy)
	ld	0 (iy), a
;src/keys.c:45: key_auto_is_pressed = cpct_isKeyPressed(Key_0);
	ld	hl, #0x0104
	call	_cpct_isKeyPressed
	ld	iy, #_key_auto_is_pressed
	ld	0 (iy), l
;src/keys.c:46: key_pause_is_pressed = cpct_isKeyPressed(Key_1);
	ld	hl, #0x0108
	call	_cpct_isKeyPressed
	ld	iy, #_key_pause_is_pressed
	ld	0 (iy), l
;src/keys.c:47: key_any_is_pressed = cpct_isAnyKeyPressed_f();
	call	_cpct_isAnyKeyPressed_f
	ld	iy, #_key_any_is_pressed
	ld	0 (iy), l
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
