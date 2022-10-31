;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module ball
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sp_ball
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
_sp_ball:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xc0	; 192
	.db #0x55	; 85	'U'
	.db #0x40	; 64
	.db #0xcc	; 204
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xcc	; 204
	.db #0x80	; 128
	.db #0xaa	; 170
	.db #0xc0	; 192
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.area _INITIALIZER
	.area _CABS (ABS)
