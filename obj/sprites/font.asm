;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module font
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sp_font_40
	.globl _sp_font_39
	.globl _sp_font_38
	.globl _sp_font_37
	.globl _sp_font_36
	.globl _sp_font_35
	.globl _sp_font_34
	.globl _sp_font_33
	.globl _sp_font_32
	.globl _sp_font_31
	.globl _sp_font_30
	.globl _sp_font_29
	.globl _sp_font_28
	.globl _sp_font_27
	.globl _sp_font_26
	.globl _sp_font_25
	.globl _sp_font_24
	.globl _sp_font_23
	.globl _sp_font_22
	.globl _sp_font_21
	.globl _sp_font_20
	.globl _sp_font_19
	.globl _sp_font_18
	.globl _sp_font_17
	.globl _sp_font_16
	.globl _sp_font_15
	.globl _sp_font_14
	.globl _sp_font_13
	.globl _sp_font_12
	.globl _sp_font_11
	.globl _sp_font_10
	.globl _sp_font_09
	.globl _sp_font_08
	.globl _sp_font_07
	.globl _sp_font_06
	.globl _sp_font_05
	.globl _sp_font_04
	.globl _sp_font_03
	.globl _sp_font_02
	.globl _sp_font_01
	.globl _sp_font_00
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
	.area _CODE
_sp_font_00:
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_01:
	.db #0x15	; 21
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_02:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_03:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_04:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_05:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_06:
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_07:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_08:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_09:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_10:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_11:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_12:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_13:
	.db #0x15	; 21
	.db #0x2a	; 42
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_14:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_15:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_16:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_17:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_18:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_19:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_20:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_21:
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_22:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_23:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_24:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_25:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_26:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_27:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_28:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_29:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_30:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_31:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_32:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_33:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_34:
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_35:
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_36:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x2a	; 42
	.db #0x15	; 21
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_37:
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_38:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_39:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
_sp_font_40:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.area _INITIALIZER
	.area _CABS (ABS)
