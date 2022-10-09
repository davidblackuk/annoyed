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
	.globl _keys_update
	.globl _keys_initialize
	.globl _cpct_getScreenPtr
	.globl _cpct_drawStringM0
	.globl _cpct_setDrawCharM0
	.globl _cpct_drawSprite
	.globl _cpct_isAnyKeyPressed
	.globl _current_ink
	.globl _loop_counter
	.globl _scene_menu
	.globl _fg_pens
	.globl _menu_print_message
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
;src/menu.c:23: void menu_initialize()
;	---------------------------------
; Function menu_initialize
; ---------------------------------
_menu_initialize::
;src/menu.c:25: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, (SCREEN_WIDTH_BYTES - SP_LOGO_W) / 2, 16);
	ld	hl, #0x100b
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/menu.c:27: keys_initialize();
	push	hl
	call	_keys_initialize
	pop	bc
;src/menu.c:29: loop_counter = 0;
	ld	hl,#_loop_counter + 0
	ld	(hl), #0x00
;src/menu.c:30: cpct_drawSprite(sp_logo, pvmem, SP_LOGO_W, SP_LOGO_H);
	ld	hl, #0x2d39
	push	hl
	push	bc
	ld	hl, #_sp_logo
	push	hl
	call	_cpct_drawSprite
;src/menu.c:34: menu_print_message(4, 90, AN_PEN_PASTEL_CYAN, "\xf2 or a: move left");
	ld	hl, #___str_0
	push	hl
	ld	hl, #0x035a
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_menu_print_message
	pop	af
;src/menu.c:35: menu_print_message(4, 105, AN_PEN_PASTEL_MAGENTA, "\xf3 or d: move right");
	inc	sp
	ld	hl,#___str_1
	ex	(sp),hl
	ld	hl, #0x0769
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_menu_print_message
	pop	af
;src/menu.c:36: menu_print_message(4, 120, AN_PEN_PASTEL_YELLOW, "\xf0 or w: serve");
	inc	sp
	ld	hl,#___str_2
	ex	(sp),hl
	ld	hl, #0x0878
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_menu_print_message
	pop	af
	pop	af
	inc	sp
	ret
_fg_pens:
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
___str_0:
	.db 0xf2
	.ascii " or a: move left"
	.db 0x00
___str_1:
	.db 0xf3
	.ascii " or d: move right"
	.db 0x00
___str_2:
	.db 0xf0
	.ascii " or w: serve"
	.db 0x00
;src/menu.c:39: void menu_draw()
;	---------------------------------
; Function menu_draw
; ---------------------------------
_menu_draw::
;src/menu.c:41: void *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 14, SCREEN_HEIGHT_ROWS - 16);
	ld	hl, #0xb80e
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	ld	c, l
	ld	b, h
;src/menu.c:43: cpct_setDrawCharM0(fg_pens[current_ink], 0);
	ld	de, #_fg_pens+0
	ld	iy, #_current_ink
	ld	l, 0 (iy)
	ld	a, 0 (iy)
	rla
	sbc	a, a
	ld	h, a
	add	hl, de
	ld	d, (hl)
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	de
	inc	sp
	call	_cpct_setDrawCharM0
	ld	hl, #___str_3
	push	hl
	call	_cpct_drawStringM0
	ret
___str_3:
	.ascii "Press any key"
	.db 0x00
;src/menu.c:47: SceneState menu_update()
;	---------------------------------
; Function menu_update
; ---------------------------------
_menu_update::
;src/menu.c:49: keys_update();
	call	_keys_update
;src/menu.c:50: if (cpct_isAnyKeyPressed())
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/menu.c:52: return SceneComplete;
	ld	l, #0x01
	ret
00102$:
;src/menu.c:55: loop_counter += 1;
	ld	iy, #_loop_counter
	inc	0 (iy)
;src/menu.c:56: if (loop_counter > COLOR_CYCLE_FREQ)
	ld	a, #0x0a
	sub	a, 0 (iy)
	jp	PO, 00115$
	xor	a, #0x80
00115$:
	jp	P, 00104$
;src/menu.c:58: loop_counter = 0;
	ld	hl,#_loop_counter + 0
	ld	(hl), #0x00
;src/menu.c:59: current_ink = (current_ink + 1) % 4;
	ld	iy, #_current_ink
	ld	c, 0 (iy)
	ld	a, 0 (iy)
	rla
	sbc	a, a
	ld	b, a
	inc	bc
	ld	hl, #0x0004
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	iy, #_current_ink
	ld	0 (iy), l
00104$:
;src/menu.c:62: return Continue;
	ld	l, #0x00
	ret
;src/menu.c:65: void module_menu_initialize()
;	---------------------------------
; Function module_menu_initialize
; ---------------------------------
_module_menu_initialize::
;src/menu.c:67: scene_menu.initialize = menu_initialize;
	ld	hl, #_menu_initialize
	ld	(_scene_menu), hl
;src/menu.c:68: scene_menu.update = menu_update;
	ld	hl, #_menu_update
	ld	((_scene_menu + 0x0004)), hl
;src/menu.c:69: scene_menu.draw = menu_draw;
	ld	hl, #_menu_draw
	ld	((_scene_menu + 0x0002)), hl
	ret
;src/menu.c:72: void menu_print_message(u8 x, u8 y, u8 fg, char *message)
;	---------------------------------
; Function menu_print_message
; ---------------------------------
_menu_print_message::
;src/menu.c:74: u8 *pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/menu.c:75: cpct_setDrawCharM0(fg, AN_PEN_BLACK);
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	hl, #7+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_cpct_setDrawCharM0
	ld	hl, #7
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_cpct_drawStringM0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
