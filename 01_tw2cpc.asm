
;TURBO WIESZCZ++ 2.0
;FOR CPC
;(C)2015, 2017 NONIEWICZ.COM
;from orig ZX ver
;CRE: 2015.09.24 (ZX)
;CRE: 2017.12.25 (CPC)

;time-cost:
;20171225 1700-2115 = 4h15m
;20171225 2220-2305 = 45m
;20171225 2335-0000 = 25m
;20171226 0000-0130 = 1h30m
;20171226 0150-0305 = 1h15m
;20171226 1050-1150 = 1h
;20171226 1220-1320 = 1h
;20171226 1405-1555 = 1h50m
;sum = 4h15m + 45m + 25m + 1h30m + 1h15m + 2h + 1h50m = 12h0m
;20171226 1630-1850 = 2h20m (msx)
;20171226 1910-2040 = 1h30m (msx)
;20171226 2145-2245 = 1h (msx)

;note: zx2cpc diffs = no: LED effect, speedup opt (cpc print slow anyway), scroll, flamer cls, own font

;todo:
;#MAIN:
;.- [!!!] ay play (50/s -> 300/s) - vortex SHOULD work [moze no msx? == no int then] [moze inny player]
;- dodac kod wielokropkow z win?
;- upd total time spent
;- make tape too
;- test it


;CPC sys calls
GRA_WR_CHAR	EQU	#BB5A
SCR_SET_MODE	EQU	#BC0E
KM_WAIT_CHAR	EQU	#BB06
SCR_SET_BORDER	EQU	#BC38
SCR_SET_INK	EQU	#BC32
KM_READ_KEY	EQU	#BB1B

;;---

SCR	EQU	#c000	;CPC std

;AY0	EQU	xret
;AY1	EQU	xret

AY0	EQU	_TS_Init2
AY1	EQU	_TS_Play

;AY0	EQU	_PC_Init
;AY1	EQU	_PC_Play

BREAK	EQU	V ;1
SEED	EQU	V+1 ;2
TMP1	EQU	V+3 ;1
MODE	EQU	V+4 ;1
TYTUL	EQU	V+5 ;2
N	EQU	V+7 ;2	;was dw 0 ?
MODE2	EQU	V+9 ;1
MODE3	EQU	V+10 ;1
EV6	EQU	V+11 ;1
NUMER	EQU	V+12 ;32
RYM	EQU	V+44 ;4*2
;	EQU	V+52 ;?

TTCNT	EQU	32
RCNT	EQU	32
ZCNT	EQU	4
WCNT	EQU	4

CL_BLACK	EQU	0
CL_RED		EQU	6
CL_GRAY		EQU	13
CL_ORANGE	EQU	15
CL_YELLOW	EQU	24
CL_WHITE	EQU	26

KEY_SPC		EQU	" "	;gen next
KEY_A		EQU	"a"	;about
KEY_H		EQU	"h"	;help
KEY_S		EQU	"s"	;(re)start
KEY_R		EQU	"r"	;
KEY_Z		EQU	"z"	;
KEY_M		EQU	"m"	;automatic ~10s


V	EQU	#07c0	;variables area

	ORG	#0800

TWRUN	XOR	A
	LD	(BREAK), A
	LD	(MODE2), A
	LD	(MODE3), A
	LD	(EV6), A

	ld	b, a
	ld	c, b
	call	SCR_SET_BORDER		;black border, b=c=0

;;;;;;;;;;;;;;debug
;	jp	xmsx
;;;;;;;;;;;;;;;;;;;;

	LD	A, R
	LD	(SEED), A
	XOR	111
	LD	(SEED+1), A

	DI				;chain to existing interrupt, CPC has RAM here!
	ld	hl, (#39)
	ld	(AFTINT+1), hl
	ld	hl, INT1
	ld	(#39), hl

SUPER	DI

	; Set ZX PSG frequency in the YMZs
	LD	BC, #F880
	LD	HL, #7704
	OUT	(C), H                      ; Set Timer 0 as clock for the YMZs
	OUT	(C), L                      ; Set the clock to 1,75 MHz (ZX frequency)

	ld	hl, MDLADDR
	CALL	AY0
	EI

	XOR	A
	LD	(MODE), A

;-- start screen

	CALL	MYCLS
	call	SET4C
	CALL	SHOW0			;start scrn
	call	KM_WAIT_CHAR		;any key

;--- scrn dissapears in style

	ld	a, 1
	ld	b, CL_GRAY
	ld	c, b
	call	SCR_SET_INK
	ld	a, 2
	ld	b, CL_BLACK
	ld	c, b
	call	SCR_SET_INK
	call	unidelay

	ld	a, 1
	ld	b, CL_BLACK
	ld	c, b
	call	SCR_SET_INK
	call	unidelay

	call	unidelay

	ld	b, 8
xflash1	push	bc
	ld	b, 26
xflash	push	bc
	ld	a, 3
	ld	c, b
	call	SCR_SET_INK
	halt
	pop	bc
	djnz	xflash
	pop	bc
	djnz	xflash1

;-- disclaimer

	CALL	MYCLS0

	ld	a, 1
	ld	b, CL_YELLOW
	ld	c, b
	call	SCR_SET_INK

	XOR	A
	LD	(BREAK), A
	LD	HL, DIZ
	CALL	LINE

	LD	B, 205
WDS	HALT
	HALT
	HALT
	HALT
	DJNZ	WDS

;-- go get some poem

	LD	A, 1
	LD	(MODE), A
	CALL	MYCLS
	call	SET4C

MAIN	LD	A, 1
	LD	(MODE), A
	CALL	WIERSZ
	XOR	A
	LD	(BREAK), A
	LD	HL, (TYTUL)
	CALL	LINE
	CALL	CRLF
	LD	HL, (NUMER)
	CALL	LINE
	LD	HL, (NUMER+2)
	CALL	LINE
	LD	HL, (NUMER+4)
	CALL	LINE
	LD	HL, (NUMER+6)
	CALL	LINE
	CALL	CRLF
	LD	HL, (NUMER+8)
	CALL	LINE
	LD	HL, (NUMER+10)
	CALL	LINE
	LD	HL, (NUMER+12)
	CALL	LINE
	LD	HL, (NUMER+14)
	CALL	LINE
	CALL	CRLF
	LD	HL, (NUMER+16)
	CALL	LINE
	LD	HL, (NUMER+18)
	CALL	LINE
	LD	HL, (NUMER+20)
	CALL	LINE
	LD	HL, (NUMER+22)
	CALL	LINE
	CALL	CRLF
	LD	HL, (NUMER+24)
	CALL	LINE
	LD	HL, (NUMER+26)
	CALL	LINE
	LD	HL, (NUMER+28)
	CALL	LINE
	LD	HL, (NUMER+30)
	CALL	LINE

WDONE	LD	A, (BREAK)
	CP	KEY_S
	JP	Z, SUPER
	CP	KEY_A
	JP	Z, ABOUT
	CP	KEY_H
	JP	Z, HELP
	CP	KEY_SPC
	JR	Z, POST1

LOOP0	LD	A, (MODE2)
	BIT	3, A
	JR	NZ, AUTOM
	call	key
	CP	KEY_S
	JP	Z, SUPER
	CP	KEY_A
	JP	Z, ABOUT
	CP	KEY_R
	JR	Z, RYMCHA
	CP	KEY_Z
	JR	Z, REPCHA
	CP	KEY_M
	JR	Z, AUTCHA
	CP	KEY_H
	JP	Z, HELP
	CP	KEY_SPC
	JR	NZ, LOOP0

POST1	CALL	FLMAIN
	CALL	MYCLS
	JP	MAIN

AUTOM	CALL	PAUS10
	call	key
	CP	KEY_S
	JP	Z, SUPER
	CP	KEY_A
	JR	Z, ABOUT
	CP	KEY_H
	JR	Z, HELP
	CP	KEY_R
	JR	Z, RYMCHA
	CP	KEY_Z
	JR	Z, REPCHA
	CP	KEY_M
	JR	Z, AUTCHA
	JR	POST1

POST2	CALL	KM_WAIT_CHAR
	JP	WDONE

REPCHA	LD	A, (MODE2)
	XOR	4
	LD	(MODE2), A
	JR	POST2

AUTCHA	LD	A, (MODE2)
	XOR	8
	LD	(MODE2), A
	JR	POST1

RYMCHA	LD	A, (MODE3)
	INC	A
	AND	3
	CP	3
	JR	NZ, RYMC1
	XOR	A
RYMC1	LD	(MODE3), A
	JR	POST2

ABOUT	XOR	A
	LD	(BREAK), A
	CALL	FLMAIN
	CALL	MYCLS2
	LD	HL, ABO_TX
	CALL	LINE
	JP	WDONE

HELP	XOR	A
	LD	(BREAK), A
	CALL	FLMAIN
	CALL	MYCLS
	LD	HL, OPTS
	CALL	LINE
	JP	WDONE

key	push	bc
	push	de
	push	hl
	call	KM_READ_KEY
	pop	hl
	pop	de
	pop	bc
xret	ret

;---

INT1
;	ld	(interrupt_previous_stack), sp
;	ld	sp, interrupt_stack_start 

	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	PUSH	IX
	PUSH	IY
	EXX
	EX	AF,AF'
	PUSH	AF
	PUSH	BC
	PUSH	DE
	PUSH	HL
	PUSH	IX
	PUSH	IY

	ld	a, (EV6)
	or	a
	CALL	z, AY1
	ld	a, (EV6)
	inc	a
	cp	6
	jr	nz, no6
	xor	a
no6	ld	(EV6), a

	POP	IY
	POP	IX
	POP	HL
	POP	DE
	POP	BC
	POP	AF
	EX	AF,AF'
	EXX
	POP	IY
	POP	IX
	POP	HL
	POP	DE
	POP	BC
	POP	AF

;	ld	sp, (interrupt_previous_stack)

AFTINT	jp	#B941

;interrupt_previous_stack
;	dw 0
;interrupt_stack
;	ds 256
;interrupt_stack_start

;---

SET4C
	ld	a, 0
	ld	b, CL_BLACK
	ld	c, b
	call	SCR_SET_INK		;bg black, a=pen, b=c=color

	ld	a, 1
	ld	b, CL_WHITE
	ld	c, b
	call	SCR_SET_INK		;should get white

	ld	a, 2
	ld	b, CL_GRAY
	ld	c, b
	call	SCR_SET_INK		;should get gray

	ld	a, 3
	ld	b, CL_RED
	ld	c, b
	call	SCR_SET_INK		;should get red

	ret

;---

MYCLS0	xor	a
	jp	SCR_SET_MODE		;screen mode = 0, also 'cls' like

MYCLS	ld	a, 1
	jp	SCR_SET_MODE		;screen mode = 1 (320x200x4), also 'cls' like

MYCLS2	ld	a, 2
	jp	SCR_SET_MODE		;screen mode = 2, also 'cls' like

SETRND	CALL	RND
	AND	RCNT-1
	LD	D, 0
	LD	E, A
	LD	A, (TMP1)
	AND	3
	LD	HL, (RYM)
	CP	0
	JR	Z, SET2
	LD	HL, (RYM+2)
	CP	1
	JR	Z, SET2
	LD	HL, (RYM+4)
	CP	2
	JR	Z, SET2
	LD	HL, (RYM+6)
SET2	ADD	HL, DE
	ADD	HL, DE
	RET

SETRYM	LD	A, (MODE3)
	AND	3
	CP	2
	JR	Z, AABB
	CP	1
	JR	Z, ABBA
	LD	HL, D0_A
	LD	(RYM), HL
	LD	HL, D1_A
	LD	(RYM+2), HL
	LD	HL, D2_A
	LD	(RYM+4), HL
	LD	HL, D3_A
	LD	(RYM+6), HL
	RET
ABBA	LD	HL, D0_A
	LD	(RYM), HL
	LD	HL, D1_A
	LD	(RYM+2), HL
	LD	HL, D3_A
	LD	(RYM+4), HL
	LD	HL, D2_A
	LD	(RYM+6), HL
	RET
AABB	LD	HL, D0_A
	LD	(RYM), HL
	LD	HL, D2_A
	LD	(RYM+2), HL
	LD	HL, D1_A
	LD	(RYM+4), HL
	LD	HL, D3_A
	LD	(RYM+6), HL
	RET

WIERSZ	CALL	SETRYM
	CALL	RND
	AND	TTCNT-1
	LD	D, 0
	LD	E, A
	LD	HL, TTLS
	ADD	HL, DE
	ADD	HL, DE

	LD	A,(HL)
	LD	(TYTUL), A
	INC	HL
	LD	A, (HL)
	LD	(TYTUL+1), A

	LD	B,ZCNT*WCNT
	LD	DE,NUMER
	XOR	A
	LD	(TMP1), A
SGEN	PUSH	BC
	PUSH	DE
	CALL	SETRND
	POP	DE
	POP	BC

	LD	A, (MODE2)
	BIT	2, A
	JR	NZ, SG1
	CALL	RCHCK
	OR	A
	JR	Z, SGEN

SG1	LD	A, (TMP1)
	INC	A
	AND	3
	LD	(TMP1), A
	LD	A, (HL)
	LD	(DE), A
	INC	DE
	INC	HL
	LD	A, (HL)
	LD	(DE), A
	INC	DE
	DJNZ	SGEN
	RET

RCHCK	LD	A,B
	CP	ZCNT*WCNT
	RET	Z
	CP	ZCNT*WCNT-1
	RET	Z
	CP	ZCNT*WCNT-2
	RET	Z
	CP	ZCNT*WCNT-3
	RET	Z

	LD	A, ZCNT*WCNT
	SUB	B
	SUB	4
	PUSH	BC
	PUSH	DE
	PUSH	HL
	LD	E, (HL)
	INC	HL
	LD	D, (HL)

	LD	HL, CDATA
	LD	C, A
	LD	B, 0
	ADD	HL, BC
	ADD	HL, BC
	ADD	HL, BC
	ADD	HL, BC
	ADD	HL, BC
	ADD	HL, BC

	LD	C, (HL)
	INC	HL
	LD	B, (HL)
	LD	(RP1+1), BC
	INC	HL
	LD	C, (HL)
	INC	HL
	LD	B, (HL)
	LD	(RP2+1), BC
	INC	HL
	LD	C, (HL)
	INC	HL
	LD	B, (HL)
	LD	(RP3+1), BC

RP1	LD	HL, (0)
	SBC	HL, DE
	LD	A, H
	OR	L
	JR	Z, R_BAD

RP2	LD	HL, (0)
	SBC	HL, DE
	LD	A, H
	OR	L
	JR	Z, R_BAD

RP3	LD	HL, (0)
	SBC	HL, DE
	LD	A, H
	OR	L
	JR	Z, R_BAD

R_OK	LD	A, 1
	JR	R_E
R_BAD	XOR	A
R_E	POP	HL
	POP	DE
	POP	BC
	RET

RND	PUSH	HL
	PUSH	DE
	LD	HL, (SEED)
	LD	A, R
	LD	D, A
	LD	E, (HL)
	ADD	HL, DE
	ADD	A, L
	XOR	H
	LD	(SEED), HL
	POP	DE
	POP	HL
	RET

LINE	PUSH	BC
LNX	LD	A, (BREAK)
	OR	A
	JR	NZ, LEXT
	LD	A, (HL)
	OR	A
	JR	Z, LEXT
	INC	HL
	CALL	CHAR
	JR	LNX
LEXT	POP	BC

CRLF	push	bc
	LD	A, 13
	CALL	GRA_WR_CHAR
	LD	A, 10
	CALL	GRA_WR_CHAR
	pop	bc
	RET

CHAR	push	hl
	call	GRA_WR_CHAR
	pop	hl
	xor	a	;??? important, apparently, but why?
	call	key
	CP	KEY_SPC
	JR	Z, CHKEY
	CP	KEY_S
	JR	Z, CHKEY
	CP	KEY_A
	JR	Z, CHKEY
	CP	KEY_H
	JR	Z, CHKEY
	RET
CHKEY	LD	(BREAK), A
	RET

FLMAIN	ld	b, 16
	ld	hl, fldata
flaa	push	bc
	push	hl
	ld	a, 1
	ld	b, (hl)
	ld	c, b
	call	SCR_SET_INK
	ld	a, r
	and	15
	or	4
	ld	b, a
	call	unide1
	pop	hl
	pop	bc
	inc	hl
	djnz	flaa
	ret

;note: screen file is 16512, while screen is 320*200/4=16000, but offset is 128
;coz 1+15+1+1+1+2+2+1+2+2+32+4+2+1+2+59 = 128 - StAmsdos is saved by ConvImgCpc
;and I include it as raw binary via incbin
;note: The successive lines in a block 
;are stored consecutively so there are 48 unused bytes at the end of each block.
;http://www.cpcwiki.eu/imgs/d/db/S968se06.pdf

SHOW0	LD	HL, ximg+128
	LD	DE, SCR
	LD	BC, 16384
	LDIR
	RET

PAUS10	LD	B, 0
	xor	a
PA10	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	HALT
	call	key
	CP	0
	JR	NZ, PAEND
	DJNZ	PA10
PAEND	RET

unidelay
	ld	b, 50
unide1	halt
	djnz	unide1
	ret

;-----------------------------------
;--- data

fldata	db CL_YELLOW, CL_WHITE, CL_YELLOW, CL_BLACK, CL_GRAY, CL_WHITE, CL_YELLOW, CL_GRAY
	db CL_BLACK, CL_RED, CL_ORANGE, CL_YELLOW, CL_WHITE, CL_GRAY, CL_RED, CL_WHITE
	;note: ^^^ end with white!

include "02_tw-data.asm"

ximg
incbin "incbin\twimgamstrad16k.bin"

;include "VTII10bG.CPC.asm"
include "playcityPT3.asm"

MDLADDR
incbin "incbin/z39-fin.pt3"

	db	" --- (C)2017 NONIEWICZ.COM, Jakub Noniewicz aka MoNsTeR/GDC --- "
