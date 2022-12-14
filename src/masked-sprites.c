#include "h/masked-sprites.h"
// NOT AUTO GENERATED!!!!!!!!!!!!!!

// ---------------------------------------------------------------------------
// Module private declarations
// ---------------------------------------------------------------------------

// specifies the SPRITE pixels that are visible
#define PNONE 0xFF
#define PRGHT 0xAA
#define PLEFT 0x55
#define PBOTH 0x00

// ---------------------------------------------------------------------------
// Module public state externally used
// ---------------------------------------------------------------------------


const u8 sp_masked_bat_left[2 * 2 * 8] = {
	PNONE, 0x00, PBOTH, 0x00,
	PRGHT, 0x00, PBOTH, 0xF3,
	PRGHT, 0x00, PBOTH, 0x0C,
	PBOTH, 0x50, PBOTH, 0xC0,
	PBOTH, 0x50, PBOTH, 0x0C,
	PRGHT, 0x00, PBOTH, 0x0C,
	PRGHT, 0x00, PBOTH, 0xF3,
	PNONE, 0x00, PBOTH, 0x00, 
};

const u8 sp_masked_bat_right[2 * 2 * 8] = {
	PBOTH, 0x00, PNONE, 0x00,
	PBOTH, 0xf3, PLEFT, 0x00,
	PBOTH, 0x0c, PLEFT, 0x00,
	PBOTH, 0xc0, PBOTH, 0xa0,
	PBOTH, 0x0c, PBOTH, 0xa0,
	PBOTH, 0x0c, PLEFT, 0x00,
	PBOTH, 0xf3, PLEFT, 0x00,
	PBOTH, 0x00, PNONE, 0x00
};

const u8 sp_masked_ball[2 * 3 * 6] = {
	PNONE, 0x00, PBOTH, 0x00, PNONE, 0x00,
	PRGHT, 0x00, PBOTH, 0xc0, PLEFT, 0x00,
	PBOTH, 0x40, PBOTH, 0xcc, PBOTH, 0x80,
	PBOTH, 0x40, PBOTH, 0xcc, PBOTH, 0x80,
	PRGHT, 0x00, PBOTH, 0xc0, PLEFT, 0x00,
	PNONE, 0x00, PBOTH, 0x00, PNONE, 0x00
};


// ---------------------------------------------------------------------------
// Module public methods
// ---------------------------------------------------------------------------


// ---------------------------------------------------------------------------
// Module private methods
// ---------------------------------------------------------------------------

