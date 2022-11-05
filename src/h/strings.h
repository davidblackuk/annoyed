#ifndef _STRINGS_H_
#define _STRINGS_H_

/// @brief gets thge length of the zero terminated string passed in.  note the 
/// input string cannot be wider than 255 chars.
/// @param str  the string to measure
/// @return the length
extern u8 strlen(char *str);

#endif