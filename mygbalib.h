#include "mygba.h"
// Define data types
typedef unsigned char uint8;
typedef unsigned short uint16;
typedef unsigned int uint32;
typedef uint16 COLOR;

// Define input constants
#define INPUT (KEY_MASK & (~REG_KEYS))

// Video memory address
#define MEM_VRAM 0x06000000
#define vid_mem ((uint16 *)MEM_VRAM)

// Display control constants
#define DCNT_MODE0 0x0000
#define DCNT_MODE1 0x0001
#define DCNT_MODE2 0x0002
#define DCNT_MODE3 0x0003
#define DCNT_MODE4 0x0004
#define DCNT_MODE5 0x0005

#define DCNT_BG0 0x0100
#define DCNT_BG1 0x0200
#define DCNT_BG2 0x0400
#define DCNT_BG3 0x0800
#define DCNT_OBJ 0x1000

// Screen dimensions
#define SCREEN_WIDTH 240
#define SCREEN_HEIGHT 160

// Color constants
#define COL_BLACK 0x0000
#define COL_RED 0x001F
#define COL_LIME 0x03E0
#define COL_YELLOW 0x03FF
#define COL_BLUE 0x7C00
#define COL_MAG 0x7C1F
#define COL_CYAN 0x7FE0
#define COL_WHITE 0x7FFF

// Key input constants
#define REG_KEYINPUT (*(volatile uint32 *)0x4000130)
#define KEY_A 0x0001
#define KEY_B 0x0002
#define KEY_SELECT 0x0004
#define KEY_START 0x0008
#define KEY_RIGHT 0x0010
#define KEY_LEFT 0x0020
#define KEY_UP 0x0040
#define KEY_DOWN 0x0080
#define KEY_R 0x0100
#define KEY_L 0x0200
#define KEY_MASK 0x03FF

// Function to create a 15-bit RGB color
inline COLOR RGB15(uint32 red, uint32 green, uint32 blue)
{
  return red | (green << 5) | (blue << 10);
}

// Function for vertical synchronization
inline void vsync()
{
  // Wait until the vertical count reaches 160, indicating the end of the visible screen area
  while (REG_VCOUNT >= 160)
    ;
  // Wait until the vertical count goes below 160, indicating the start of the next frame
  while (REG_VCOUNT < 160)
    ;
}
