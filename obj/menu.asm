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
	.globl _text_write_string
	.globl _keys_update
	.globl _keys_initialize
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _cpct_memset
	.globl _current_ink
	.globl _loop_counter
	.globl _scene_menu
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scene_menu::
	.ds 6
_loop_counter::
	.ds 1
_current_ink::
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
;src/menu.c:18: void menu_initialize()
;	---------------------------------
; Function menu_initialize
; ---------------------------------
_menu_initialize::
;src/menu.c:20: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 0);
	ld	hl, #0x000b
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/menu.c:21: cpct_clearScreen(AN_PEN_BLACK);
	push	hl
	ld	hl, #0x4000
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, #0xc0
	push	hl
	call	_cpct_memset
	call	_keys_initialize
	pop	bc
;src/menu.c:25: loop_counter = 0;
	ld	hl,#_loop_counter + 0
	ld	(hl), #0x00
;src/menu.c:26: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
	ld	hl, #0x2d39
	push	hl
	push	bc
	ld	hl, #_sp_logo
	push	hl
	call	_cpct_drawSprite
	ret
;src/menu.c:31: void menu_draw()
;	---------------------------------
; Function menu_draw
; ---------------------------------
_menu_draw::
;src/menu.c:33: text_write_string(0,64, "AFTER A SERIES OF FRANKLY BIZZARE EVENTS");
	ld	hl, #___str_0
	push	hl
	ld	hl, #0x4000
	push	hl
	call	_text_write_string
	pop	af
;src/menu.c:34: text_write_string(0,76, "YOUR SPACESHIP IS IN TROUBLE.");
	ld	hl, #___str_1
	ex	(sp),hl
	ld	hl, #0x4c00
	push	hl
	call	_text_write_string
	pop	af
;src/menu.c:36: text_write_string(0,96, "INEXPLICABLY, TO SURVIVE, YOU NEED TO");
	ld	hl, #___str_2
	ex	(sp),hl
	ld	hl, #0x6000
	push	hl
	call	_text_write_string
	pop	af
;src/menu.c:37: text_write_string(0,108, "REMOVE BLOCKS FROM A WALL USING A BALL.");
	ld	hl, #___str_3
	ex	(sp),hl
	ld	hl, #0x6c00
	push	hl
	call	_text_write_string
	pop	af
;src/menu.c:40: text_write_string(0,132, "YEAH, WE KNOW...");
	ld	hl, #___str_4
	ex	(sp),hl
	ld	hl, #0x8400
	push	hl
	call	_text_write_string
	pop	af
;src/menu.c:42: text_write_string(0,156, "WASD OR ARROW KEYS TO PLAY. UP TO SERVE");
	ld	hl, #___str_5
	ex	(sp),hl
	ld	hl, #0x9c00
	push	hl
	call	_text_write_string
	pop	af
;src/menu.c:44: text_write_centered_string(200-8, "PRESS ANY OLD KEY TO START");
	ld	hl, #___str_6
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
	.ascii "WASD OR ARROW KEYS TO PLAY. UP TO SERVE"
	.db 0x00
___str_6:
	.ascii "PRESS ANY OLD KEY TO START"
	.db 0x00
;src/menu.c:48: SceneState menu_update()
;	---------------------------------
; Function menu_update
; ---------------------------------
_menu_update::
;src/menu.c:50: keys_update();
	call	_keys_update
;src/menu.c:51: if (cpct_isAnyKeyPressed())
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/menu.c:53: return SceneComplete;
	ld	l, #0x01
	ret
00102$:
;src/menu.c:56: return Continue;
	ld	l, #0x00
	ret
;src/menu.c:59: void module_menu_initialize()
;	---------------------------------
; Function module_menu_initialize
; ---------------------------------
_module_menu_initialize::
;src/menu.c:61: scene_menu.initialize = menu_initialize;
	ld	hl, #_menu_initialize
	ld	(_scene_menu), hl
;src/menu.c:62: scene_menu.update = menu_update;
	ld	hl, #_menu_update
	ld	((_scene_menu + 0x0004)), hl
;src/menu.c:63: scene_menu.draw = menu_draw;
	ld	hl, #_menu_draw
	ld	((_scene_menu + 0x0002)), hl
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
