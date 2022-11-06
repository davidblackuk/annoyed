;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module globals
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _level_definitions
	.globl _current_level
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_current_level::
	.ds 2
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
_level_definitions:
	.dw _g_tilemap_l01_background
	.dw _g_tilemap_debug_blocks
	.db #0x05	; 5
	.db #0x02	; 2
	.dw _g_tilemap_l02_background
	.dw _g_tilemap_l02_blocks
	.db #0x0a	; 10
	.db #0x02	; 2
	.dw _g_tilemap_l03_background
	.dw _g_tilemap_l03_blocks
	.db #0x0f	; 15
	.db #0x02	; 2
	.area _INITIALIZER
	.area _CABS (ABS)
