#ifndef _TEXT_H
#define _TEXT_H

#include <types.h>

/// @brief Pointers to the 10 sprites representing digits 0..9
extern  u8 * const digits[10];


/// @brief writes a string to the screen at the specified coordinates. 
///
/// Note the font is partial and very sprecific to this game. We have 0-9, A-Z 
/// (upper) and some punctuation.
///
/// characters are 3 pixels wide with a traing pixel padding and 8 pixels high
/// with a single pixel row for a descender. The background is
/// black (as pen 0 so can be changed via ink)
///
/// The caller is required to prevent overflow, text flowing off the screen can
/// cause the app to crash or become corrupted.
///
/// @param x the _byte_ x coordinate of the string to draw (0..80) 
/// @param y the screen row to render at (0..192)
/// @param text the zero-terminated text to render. 
extern void text_write_string(u8 x, u8 y, char * text);


/// @brief writes a string centered in the screen starting in the specified row. 
///
/// Note the font is partial and very sprecific to this game. We have 0-9, A-Z 
/// (upper) and some punctuation.
///
/// characters are 3 pixels wide with a traing pixel padding and 8 pixels high
/// with a single pixel row for a descender. The background is
/// black (as pen 0 so can be changed via ink)
///
/// The caller is required to prevent overflow, text flowing off the screen can
/// cause the app to crash or become corrupted.
///
/// @param y the screen row to render at (0..192)
/// @param text the zero-terminated text to render. 
extern void text_write_centered_string(u8 y, char * text);

/// @brief writes the 16 bit number padded with leading zeros to the specified 
/// coordinates in screen space. this method uses sprites for the fonat and
/// is more efficient than using ROM routines in the firmware
/// @param x the x coordinate of the string (byte value 0..79) However the 
/// behaviour of this function if you overflow the right hand of the screen is 
/// undefined (or possibly disasterous)
/// @param y the row y coordinate, do not overflow the screen so realisically 
/// 198 is the may y coord
/// @param number the number to output
extern void text_write_number(u8 x, u8 y, u16 number);

#endif
