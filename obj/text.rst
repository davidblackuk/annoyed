                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _strlen
                             12 	.globl _cpct_getScreenPtr
                             13 	.globl _cpct_drawSprite
                             14 	.globl _text_write_centered_string
                             15 	.globl _text_write_string
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/text.c:19: void text_write_centered_string(u8 y, char *text)
                             48 ;	---------------------------------
                             49 ; Function text_write_centered_string
                             50 ; ---------------------------------
   7D34                      51 _text_write_centered_string::
                             52 ;src/text.c:21: u8 x = (SCREEN_WIDTH_BYTES - strlen(text) * SP_FONT_CHAR_W) / 2;
   7D34 21 03 00      [10]   53 	ld	hl, #3
   7D37 39            [11]   54 	add	hl, sp
   7D38 4E            [ 7]   55 	ld	c, (hl)
   7D39 23            [ 6]   56 	inc	hl
   7D3A 46            [ 7]   57 	ld	b, (hl)
   7D3B C5            [11]   58 	push	bc
   7D3C CD 98 81      [17]   59 	call	_strlen
   7D3F F1            [10]   60 	pop	af
   7D40 29            [11]   61 	add	hl, hl
   7D41 4D            [ 4]   62 	ld	c, l
   7D42 44            [ 4]   63 	ld	b, h
   7D43 3E 50         [ 7]   64 	ld	a, #0x50
   7D45 91            [ 4]   65 	sub	a, c
   7D46 4F            [ 4]   66 	ld	c, a
   7D47 3E 00         [ 7]   67 	ld	a, #0x00
   7D49 98            [ 4]   68 	sbc	a, b
   7D4A 47            [ 4]   69 	ld	b, a
   7D4B CB 38         [ 8]   70 	srl	b
   7D4D CB 19         [ 8]   71 	rr	c
   7D4F 41            [ 4]   72 	ld	b, c
                             73 ;src/text.c:22: text_write_string(x, y, text);
   7D50 21 03 00      [10]   74 	ld	hl, #3
   7D53 39            [11]   75 	add	hl, sp
   7D54 7E            [ 7]   76 	ld	a, (hl)
   7D55 23            [ 6]   77 	inc	hl
   7D56 66            [ 7]   78 	ld	h, (hl)
   7D57 6F            [ 4]   79 	ld	l, a
   7D58 E5            [11]   80 	push	hl
   7D59 21 04 00      [10]   81 	ld	hl, #4+0
   7D5C 39            [11]   82 	add	hl, sp
   7D5D 7E            [ 7]   83 	ld	a, (hl)
   7D5E F5            [11]   84 	push	af
   7D5F 33            [ 6]   85 	inc	sp
   7D60 C5            [11]   86 	push	bc
   7D61 33            [ 6]   87 	inc	sp
   7D62 CD 68 7D      [17]   88 	call	_text_write_string
   7D65 F1            [10]   89 	pop	af
   7D66 F1            [10]   90 	pop	af
   7D67 C9            [10]   91 	ret
                             92 ;src/text.c:25: void text_write_string(u8 x, u8 y, char *text)
                             93 ;	---------------------------------
                             94 ; Function text_write_string
                             95 ; ---------------------------------
   7D68                      96 _text_write_string::
   7D68 DD E5         [15]   97 	push	ix
   7D6A DD 21 00 00   [14]   98 	ld	ix,#0
   7D6E DD 39         [15]   99 	add	ix,sp
   7D70 21 F9 FF      [10]  100 	ld	hl, #-7
   7D73 39            [11]  101 	add	hl, sp
   7D74 F9            [ 6]  102 	ld	sp, hl
                            103 ;src/text.c:27: u8 *svmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   7D75 DD 66 05      [19]  104 	ld	h, 5 (ix)
   7D78 DD 6E 04      [19]  105 	ld	l, 4 (ix)
   7D7B E5            [11]  106 	push	hl
   7D7C 21 00 C0      [10]  107 	ld	hl, #0xc000
   7D7F E5            [11]  108 	push	hl
   7D80 CD BE 82      [17]  109 	call	_cpct_getScreenPtr
   7D83 DD 75 FB      [19]  110 	ld	-5 (ix), l
   7D86 DD 74 FC      [19]  111 	ld	-4 (ix), h
                            112 ;src/text.c:31: while (*text)
   7D89 DD 7E 06      [19]  113 	ld	a, 6 (ix)
   7D8C DD 77 FD      [19]  114 	ld	-3 (ix), a
   7D8F DD 7E 07      [19]  115 	ld	a, 7 (ix)
   7D92 DD 77 FE      [19]  116 	ld	-2 (ix), a
   7D95                     117 00117$:
   7D95 DD 6E FD      [19]  118 	ld	l,-3 (ix)
   7D98 DD 66 FE      [19]  119 	ld	h,-2 (ix)
   7D9B 7E            [ 7]  120 	ld	a, (hl)
   7D9C DD 77 FF      [19]  121 	ld	-1 (ix), a
   7D9F B7            [ 4]  122 	or	a, a
   7DA0 CA 74 7E      [10]  123 	jp	Z, 00120$
                            124 ;src/text.c:33: charsprite = 0;
   7DA3 21 00 00      [10]  125 	ld	hl, #0x0000
   7DA6 E3            [19]  126 	ex	(sp), hl
                            127 ;src/text.c:36: index = (*text) - '0';
   7DA7 DD 4E FF      [19]  128 	ld	c, -1 (ix)
                            129 ;src/text.c:34: if (*text >= '0' && *text <= '9')
   7DAA DD 7E FF      [19]  130 	ld	a, -1 (ix)
   7DAD D6 30         [ 7]  131 	sub	a, #0x30
   7DAF 38 1B         [12]  132 	jr	C,00112$
   7DB1 3E 39         [ 7]  133 	ld	a, #0x39
   7DB3 DD 96 FF      [19]  134 	sub	a, -1 (ix)
   7DB6 38 14         [12]  135 	jr	C,00112$
                            136 ;src/text.c:36: index = (*text) - '0';
   7DB8 79            [ 4]  137 	ld	a, c
   7DB9 C6 D0         [ 7]  138 	add	a, #0xd0
   7DBB 6F            [ 4]  139 	ld	l, a
                            140 ;src/text.c:37: charsprite = sp_font_00 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
   7DBC 26 00         [ 7]  141 	ld	h, #0x00
   7DBE 29            [11]  142 	add	hl, hl
   7DBF 29            [11]  143 	add	hl, hl
   7DC0 29            [11]  144 	add	hl, hl
   7DC1 29            [11]  145 	add	hl, hl
   7DC2 11 F4 5B      [10]  146 	ld	de, #_sp_font_00
   7DC5 19            [11]  147 	add	hl, de
   7DC6 33            [ 6]  148 	inc	sp
   7DC7 33            [ 6]  149 	inc	sp
   7DC8 E5            [11]  150 	push	hl
   7DC9 C3 42 7E      [10]  151 	jp	00113$
   7DCC                     152 00112$:
                            153 ;src/text.c:39: else if (*text >= 'A' && *text <= 'Z')
   7DCC DD 7E FF      [19]  154 	ld	a, -1 (ix)
   7DCF D6 41         [ 7]  155 	sub	a, #0x41
   7DD1 38 1A         [12]  156 	jr	C,00108$
   7DD3 3E 5A         [ 7]  157 	ld	a, #0x5a
   7DD5 DD 96 FF      [19]  158 	sub	a, -1 (ix)
   7DD8 38 13         [12]  159 	jr	C,00108$
                            160 ;src/text.c:41: index = (*text) - 'A';
   7DDA 79            [ 4]  161 	ld	a, c
   7DDB C6 BF         [ 7]  162 	add	a, #0xbf
   7DDD 6F            [ 4]  163 	ld	l, a
                            164 ;src/text.c:42: charsprite = sp_font_10 + (index * (SP_FONT_CHAR_W * SP_FONT_CHAR_H));
   7DDE 26 00         [ 7]  165 	ld	h, #0x00
   7DE0 29            [11]  166 	add	hl, hl
   7DE1 29            [11]  167 	add	hl, hl
   7DE2 29            [11]  168 	add	hl, hl
   7DE3 29            [11]  169 	add	hl, hl
   7DE4 11 94 5C      [10]  170 	ld	de, #_sp_font_10
   7DE7 19            [11]  171 	add	hl, de
   7DE8 33            [ 6]  172 	inc	sp
   7DE9 33            [ 6]  173 	inc	sp
   7DEA E5            [11]  174 	push	hl
   7DEB 18 55         [12]  175 	jr	00113$
   7DED                     176 00108$:
                            177 ;src/text.c:46: switch (*text)
   7DED DD 7E FF      [19]  178 	ld	a, -1 (ix)
   7DF0 D6 20         [ 7]  179 	sub	a, #0x20
   7DF2 28 32         [12]  180 	jr	Z,00103$
   7DF4 DD 7E FF      [19]  181 	ld	a, -1 (ix)
   7DF7 D6 2C         [ 7]  182 	sub	a, #0x2c
   7DF9 28 3F         [12]  183 	jr	Z,00105$
   7DFB DD 7E FF      [19]  184 	ld	a, -1 (ix)
   7DFE D6 2E         [ 7]  185 	sub	a, #0x2e
   7E00 28 2E         [12]  186 	jr	Z,00104$
   7E02 DD 7E FF      [19]  187 	ld	a, -1 (ix)
   7E05 D6 3A         [ 7]  188 	sub	a, #0x3a
   7E07 28 09         [12]  189 	jr	Z,00101$
   7E09 DD 7E FF      [19]  190 	ld	a, -1 (ix)
   7E0C D6 3F         [ 7]  191 	sub	a, #0x3f
   7E0E 28 0C         [12]  192 	jr	Z,00102$
   7E10 18 30         [12]  193 	jr	00113$
                            194 ;src/text.c:48: case ':':
   7E12                     195 00101$:
                            196 ;src/text.c:49: charsprite = sp_font_36;
   7E12 DD 36 F9 34   [19]  197 	ld	-7 (ix), #<(_sp_font_36)
   7E16 DD 36 FA 5E   [19]  198 	ld	-6 (ix), #>(_sp_font_36)
                            199 ;src/text.c:50: break;
   7E1A 18 26         [12]  200 	jr	00113$
                            201 ;src/text.c:51: case '?':
   7E1C                     202 00102$:
                            203 ;src/text.c:52: charsprite = sp_font_37;
   7E1C DD 36 F9 44   [19]  204 	ld	-7 (ix), #<(_sp_font_37)
   7E20 DD 36 FA 5E   [19]  205 	ld	-6 (ix), #>(_sp_font_37)
                            206 ;src/text.c:53: break;
   7E24 18 1C         [12]  207 	jr	00113$
                            208 ;src/text.c:54: case ' ':
   7E26                     209 00103$:
                            210 ;src/text.c:55: charsprite = sp_font_38;
   7E26 DD 36 F9 54   [19]  211 	ld	-7 (ix), #<(_sp_font_38)
   7E2A DD 36 FA 5E   [19]  212 	ld	-6 (ix), #>(_sp_font_38)
                            213 ;src/text.c:56: break;
   7E2E 18 12         [12]  214 	jr	00113$
                            215 ;src/text.c:57: case '.':
   7E30                     216 00104$:
                            217 ;src/text.c:58: charsprite = sp_font_39;
   7E30 DD 36 F9 64   [19]  218 	ld	-7 (ix), #<(_sp_font_39)
   7E34 DD 36 FA 5E   [19]  219 	ld	-6 (ix), #>(_sp_font_39)
                            220 ;src/text.c:59: break;
   7E38 18 08         [12]  221 	jr	00113$
                            222 ;src/text.c:60: case ',':
   7E3A                     223 00105$:
                            224 ;src/text.c:61: charsprite = sp_font_40;
   7E3A DD 36 F9 74   [19]  225 	ld	-7 (ix), #<(_sp_font_40)
   7E3E DD 36 FA 5E   [19]  226 	ld	-6 (ix), #>(_sp_font_40)
                            227 ;src/text.c:63: }
   7E42                     228 00113$:
                            229 ;src/text.c:66: if (charsprite != 0)
   7E42 DD 7E FA      [19]  230 	ld	a, -6 (ix)
   7E45 DD B6 F9      [19]  231 	or	a,-7 (ix)
   7E48 28 0F         [12]  232 	jr	Z,00116$
                            233 ;src/text.c:68: cpct_drawSprite(charsprite, svmem, SP_FONT_CHAR_W, SP_FONT_CHAR_H);
   7E4A D1            [10]  234 	pop	de
   7E4B C1            [10]  235 	pop	bc
   7E4C C5            [11]  236 	push	bc
   7E4D D5            [11]  237 	push	de
   7E4E D1            [10]  238 	pop	de
   7E4F D5            [11]  239 	push	de
   7E50 21 02 08      [10]  240 	ld	hl, #0x0802
   7E53 E5            [11]  241 	push	hl
   7E54 C5            [11]  242 	push	bc
   7E55 D5            [11]  243 	push	de
   7E56 CD 53 7F      [17]  244 	call	_cpct_drawSprite
   7E59                     245 00116$:
                            246 ;src/text.c:71: text++;
   7E59 DD 34 FD      [23]  247 	inc	-3 (ix)
   7E5C 20 03         [12]  248 	jr	NZ,00176$
   7E5E DD 34 FE      [23]  249 	inc	-2 (ix)
   7E61                     250 00176$:
                            251 ;src/text.c:72: svmem += 2;
   7E61 DD 7E FB      [19]  252 	ld	a, -5 (ix)
   7E64 C6 02         [ 7]  253 	add	a, #0x02
   7E66 DD 77 FB      [19]  254 	ld	-5 (ix), a
   7E69 DD 7E FC      [19]  255 	ld	a, -4 (ix)
   7E6C CE 00         [ 7]  256 	adc	a, #0x00
   7E6E DD 77 FC      [19]  257 	ld	-4 (ix), a
   7E71 C3 95 7D      [10]  258 	jp	00117$
   7E74                     259 00120$:
   7E74 DD F9         [10]  260 	ld	sp, ix
   7E76 DD E1         [14]  261 	pop	ix
   7E78 C9            [10]  262 	ret
                            263 	.area _CODE
                            264 	.area _INITIALIZER
                            265 	.area _CABS (ABS)
