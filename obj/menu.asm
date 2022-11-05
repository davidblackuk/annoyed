;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module menu
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _module_menu_initialize
	.globl _menu_update
	.globl _menu_draw
	.globl _menu_initialize
	.globl _text_write_centered_string
	.globl _keys_update
	.globl _keys_initialize
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_memset
	.globl _scene_menu
	.globl _write_text
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scene_menu::
	.ds 6
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
;src/menu.c:27: void menu_initialize()
;	---------------------------------
; Function menu_initialize
; ---------------------------------
_menu_initialize::
;src/menu.c:29: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
	ld	hl, #0x000b
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/menu.c:30: cpct_clearScreen(AN_PEN_BLACK);
	push	hl
	ld	bc, #0x4000
	push	bc
	xor	a, a
	push	af
	inc	sp
	ld	bc, #0xc000
	push	bc
	call	_cpct_memset
	call	_keys_initialize
	pop	hl
;src/menu.c:34: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
	ld	bc, #_sp_logo+0
	ld	de, #0x2d39
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
;src/menu.c:35: write_text();
	call	_write_text
	ret
;src/menu.c:38: void menu_draw()
;	---------------------------------
; Function menu_draw
; ---------------------------------
_menu_draw::
;src/menu.c:40: }
	ret
;src/menu.c:42: SceneState menu_update()
;	---------------------------------
; Function menu_update
; ---------------------------------
_menu_update::
;src/menu.c:44: keys_update();
	call	_keys_update
;src/menu.c:45: if (cpct_isAnyKeyPressed())
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/menu.c:47: return SceneComplete;
	ld	l, #0x01
	ret
00102$:
;src/menu.c:50: return Continue;
	ld	l, #0x00
	ret
;src/menu.c:53: void module_menu_initialize()
;	---------------------------------
; Function module_menu_initialize
; ---------------------------------
_module_menu_initialize::
;src/menu.c:55: scene_menu.initialize = menu_initialize;
	ld	hl, #_menu_initialize
	ld	(_scene_menu), hl
;src/menu.c:56: scene_menu.update = menu_update;
	ld	hl, #_menu_update
	ld	((_scene_menu + 0x0004)), hl
;src/menu.c:57: scene_menu.draw = menu_draw;
	ld	hl, #_menu_draw
	ld	((_scene_menu + 0x0002)), hl
	ret
;src/menu.c:64: void write_text()
;	---------------------------------
; Function write_text
; ---------------------------------
_write_text::
;src/menu.c:66: text_write_centered_string(64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
	ld	hl, #___str_0
	push	hl
	ld	a, #0x40
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:67: text_write_centered_string(76, "YOUR SPACESHIP IS IN TROUBLE.");
	inc	sp
	ld	hl,#___str_1
	ex	(sp),hl
	ld	a, #0x4c
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:69: text_write_centered_string(96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
	inc	sp
	ld	hl,#___str_2
	ex	(sp),hl
	ld	a, #0x60
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:70: text_write_centered_string(108, "REMOVE BLOCKS FROM A WALL USING A BALL.");
	inc	sp
	ld	hl,#___str_3
	ex	(sp),hl
	ld	a, #0x6c
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:72: text_write_centered_string(132, "YEAH, WE KNOW...");
	inc	sp
	ld	hl,#___str_4
	ex	(sp),hl
	ld	a, #0x84
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:74: text_write_centered_string(156, "WASD OR ARROW KEYS TO PLAY.");
	inc	sp
	ld	hl,#___str_5
	ex	(sp),hl
	ld	a, #0x9c
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:75: text_write_centered_string(168, "UP TO SERVE");
	inc	sp
	ld	hl,#___str_6
	ex	(sp),hl
	ld	a, #0xa8
	push	af
	inc	sp
	call	_text_write_centered_string
;src/menu.c:77: text_write_centered_string(200 - 8, "PRESS ANY OLD KEY TO START");
	inc	sp
	ld	hl,#___str_7
	ex	(sp),hl
	ld	a, #0xc0
	push	af
	inc	sp
	call	_text_write_centered_string
	pop	af
	inc	sp
	ret
___str_0:
	.ascii "AFTER A SERIES OF FRANKLY BIZZARE EVENTS"
	.db 0x00
___str_1:
	.ascii "YOUR SPACESHIP IS IN TROUBLE."
	.db 0x00
___str_2:
	.ascii "INEXPLICABLY, TO SURVIVE, YOU NEED TO"
	.db 0x00
___str_3:
	.ascii "REMOVE BLOCKS FROM A WALL USING A BALL."
	.db 0x00
___str_4:
	.ascii "YEAH, WE KNOW..."
	.db 0x00
___str_5:
	.ascii "WASD OR ARROW KEYS TO PLAY."
	.db 0x00
___str_6:
	.ascii "UP TO SERVE"
	.db 0x00
___str_7:
	.ascii "PRESS ANY OLD KEY TO START"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
