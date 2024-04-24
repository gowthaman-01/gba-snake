#include <mygba.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "mygbalib.h"
#include "sprite.h"

// -----------------------------------------------------------------------------
// Constants and Global Variables.
// -----------------------------------------------------------------------------
#define TITLE_PLAYING 0
#define TITLE_END 1
#define END_PLAYING 0
#define END_RESTART 1
#define SNAKE_LEFT 0
#define SNAKE_RIGHT 2
#define SNAKE_UP 0
#define SNAKE_DOWN 2
#define LEFT 0
#define RIGHT 1
#define UP 2
#define DOWN 3
#define SNAKE_STOPPED 1
#define NUM_CELLS_X 22
#define NUM_CELLS_Y 14
#define SIZE_CELL 10
#define SIZE_FRAME 2
#define SIZE_PADDING 8
#define STATE_PLAYING 0
#define STATE_WON 1
#define STATE_LOST 2
#define STATE_JUST_LAUNCHED 0
#define STATE_TITLE 1
#define STATE_GAME 2
#define STATE_END 3
#define STATE_PAUSE 4

// Font data for rendering text.
// Each entry in the array represents a glyph (character) in the font.
// Each glyph is defined by a 8x8 pixel matrix, encoded as a 32-bit unsigned integer.
const unsigned int fontTiles[192] =
    {
        0x00000000,
        0x00000000,
        0x18181818,
        0x00180018,
        0x00003636,
        0x00000000,
        0x367F3636,
        0x0036367F,
        0x3C067C18,
        0x00183E60,
        0x1B356600,
        0x0033566C,
        0x6E16361C,
        0x00DE733B,
        0x000C1818,
        0x00000000,
        0x0C0C1830,
        0x0030180C,
        0x3030180C,
        0x000C1830,
        0xFF3C6600,
        0x0000663C,
        0x7E181800,
        0x00001818,
        0x00000000,
        0x0C181800,
        0x7E000000,
        0x00000000,
        0x00000000,
        0x00181800,
        0x183060C0,
        0x0003060C,
        0x7E76663C,
        0x003C666E,
        0x181E1C18,
        0x00181818,
        0x3060663C,
        0x007E0C18,
        0x3860663C,
        0x003C6660,
        0x33363C38,
        0x0030307F,
        0x603E067E,
        0x003C6660,
        0x3E060C38,
        0x003C6666,
        0x3060607E,
        0x00181818,
        0x3C66663C,
        0x003C6666,
        0x7C66663C,
        0x001C3060,
        0x00181800,
        0x00181800,
        0x00181800,
        0x0C181800,
        0x06186000,
        0x00006018,
        0x007E0000,
        0x0000007E,
        0x60180600,
        0x00000618,
        0x3060663C,
        0x00180018,
        0x5A5A663C,
        0x003C067A,
        0x7E66663C,
        0x00666666,
        0x3E66663E,
        0x003E6666,
        0x06060C78,
        0x00780C06,
        0x6666361E,
        0x001E3666,
        0x1E06067E,
        0x007E0606,
        0x1E06067E,
        0x00060606,
        0x7606663C,
        0x007C6666,
        0x7E666666,
        0x00666666,
        0x1818183C,
        0x003C1818,
        0x60606060,
        0x003C6660,
        0x0F1B3363,
        0x0063331B,
        0x06060606,
        0x007E0606,
        0x6B7F7763,
        0x00636363,
        0x7B6F6763,
        0x00636373,
        0x6666663C,
        0x003C6666,
        0x3E66663E,
        0x00060606,
        0x3333331E,
        0x007E3B33,
        0x3E66663E,
        0x00666636,
        0x3C0E663C,
        0x003C6670,
        0x1818187E,
        0x00181818,
        0x66666666,
        0x003C6666,
        0x66666666,
        0x00183C3C,
        0x6B636363,
        0x0063777F,
        0x183C66C3,
        0x00C3663C,
        0x183C66C3,
        0x00181818,
        0x0C18307F,
        0x007F0306,
        0x0C0C0C3C,
        0x003C0C0C,
        0x180C0603,
        0x00C06030,
        0x3030303C,
        0x003C3030,
        0x00663C18,
        0x00000000,
        0x00000000,
        0x003F0000,
        0x00301818,
        0x00000000,
        0x603C0000,
        0x007C667C,
        0x663E0606,
        0x003E6666,
        0x063C0000,
        0x003C0606,
        0x667C6060,
        0x007C6666,
        0x663C0000,
        0x003C067E,
        0x0C3E0C38,
        0x000C0C0C,
        0x667C0000,
        0x3C607C66,
        0x663E0606,
        0x00666666,
        0x18180018,
        0x00301818,
        0x30300030,
        0x1E303030,
        0x36660606,
        0x0066361E,
        0x18181818,
        0x00301818,
        0x7F370000,
        0x0063636B,
        0x663E0000,
        0x00666666,
        0x663C0000,
        0x003C6666,
        0x663E0000,
        0x06063E66,
        0x667C0000,
        0x60607C66,
        0x663E0000,
        0x00060606,
        0x063C0000,
        0x003E603C,
        0x0C3E0C0C,
        0x00380C0C,
        0x66660000,
        0x007C6666,
        0x66660000,
        0x00183C66,
        0x63630000,
        0x00367F6B,
        0x36630000,
        0x0063361C,
        0x66660000,
        0x0C183C66,
        0x307E0000,
        0x007E0C18,
        0x0C181830,
        0x00301818,
        0x18181818,
        0x00181818,
        0x3018180C,
        0x000C1818,
        0x003B6E00,
        0x00000000,
        0x00000000,
        0x00000000,
};

// Pseudo-random number generator state.
static unsigned long int next = 1;

// Current and previous keyboard input.
uint16 key_cur;
uint16 key_prev;

// Application states.
uint8 state = TITLE_PLAYING;
uint8 gameState;
uint8 AppState = STATE_JUST_LAUNCHED;
uint8 TargetState = STATE_TITLE;

// Current direction of movement.
uint8 currentDirection;

// Grid representing the game environment.
uint8 grid[NUM_CELLS_Y * NUM_CELLS_X];

// Starting position of the game grid.
const int gridStart = SIZE_FRAME + SIZE_PADDING;

// Game results.
static int result = 0;

// Snake structures.
typedef struct SnakeNode SnakeNode;
struct SnakeNode
{
    SnakeNode *prev;
    int x;
    int y;
};

typedef struct
{
    SnakeNode head;
    SnakeNode *tail;
    SnakeNode freeNodes[NUM_CELLS_Y * NUM_CELLS_X]; // Array of free nodes.
    int length;                                     // Length of the snake.
    int xVel;                                       // X velocity of the snake.
    int yVel;                                       // Y velocity of the snake.
    int lastXMov;                                   // Last X movement of the snake.
    int lastYMov;                                   // Last Y movement of the snake.
} Snake;

Snake snake;
SnakeNode targetNode;

// -----------------------------------------------------------------------------
// Function prototypes.
// -----------------------------------------------------------------------------
void *memset(void *ptr, int, size_t num);
int ha_rand(void);
void ha_srand(unsigned int seed);
void key_poll();
void handleTitleInput();
void handleGameInput();
void handleGameOverInput();
int getTitleScreenState();
int getGameState();
void tickAndDrawGame();
int getGameOverState();
void beginTitleScreen();
void restartGame();
void beginGameOverScreen();
void spawnTargetNode();
uint8 getCellValue(int x, int y);
void drawSprite(int numb, int N, int x, int y);
void setCellValue(int x, int y, uint8 value);
void drawRect(int left, int top, int right, int bottom, COLOR clr);
void drawPixel(int x, int y, COLOR clr);
extern int calc_pixel_location(int x, int y);
void UpdateVelocityX(Snake *s, int vel);
void UpdateVelocityY(Snake *s, int vel);
void AddNode(Snake *s);
void InitSnake(Snake *snake, int startX, int startY, int maxLen);
int UpdateSnake(Snake *s);

// -----------------------------------------------------------------------------
// Main function.
// -----------------------------------------------------------------------------
/**
 * @brief Main function for the game loop.
 *
 * This function initializes the display and interrupts,
 * then enters an infinite loop to manage the game states
 * and handle user input.
 *
 * @return 0 upon successful completion.
 */
int main()
{
    // Initialize the display mode to mode 3 and enable background 2.
    REG_DISPCNT = DCNT_MODE3 | DCNT_BG2;

    // Enable interrupts to allow for event-driven behavior.
    REG_IME = 1;

    // Main game loop.
    while (1)
    {
        // Perform actions every frame.
        for (int i = 0; i < 4; ++i)
        {
            // Synchronize with vertical blanking period.
            vsync();

            // Poll keyboard input.
            key_poll();

            // Handle game state transitions based on current state.
            switch (AppState)
            {
            case STATE_TITLE:
                handleTitleInput();
                break;
            case STATE_GAME:
                handleGameInput();
                break;
            case STATE_END:
                handleGameOverInput();
                break;
            }
        }

        // Check for state transitions.
        if (TargetState != AppState)
        {
            AppState = TargetState;

            switch (AppState)
            {
            case STATE_TITLE:
                beginTitleScreen();
                break;
            case STATE_GAME:
                restartGame();
                break;
            case STATE_END:
                beginGameOverScreen();
                break;
            default:
                break;
            }
        }
        else
        {
            int currentState;
            switch (AppState)
            {
            case STATE_TITLE:
            {
                // Check if user has pressed the start button.
                currentState = getTitleScreenState();
                if (currentState == TITLE_END)
                {
                    TargetState = STATE_GAME;
                }
            }
            break;
            case STATE_GAME:
            {
                // Check if game has been won, lost, or is still ongoing.
                currentState = getGameState();
                if (gameState == STATE_WON || gameState == STATE_LOST)
                {
                    TargetState = STATE_END;
                }
                else if (gameState == STATE_PLAYING)
                {
                    tickAndDrawGame();
                }
            }
            break;
            case STATE_END:
            {
                // Check if user has pressed the start button.
                currentState = getGameOverState();
                if (currentState == END_RESTART)
                {
                    TargetState = STATE_GAME;
                }
            }
            break;
            }
        }
    }

    return 0;
}

// -----------------------------------------------------------------------------
// UI utility functions.
// -----------------------------------------------------------------------------
/**
 * Draws a single pixel at the specified coordinates with the given color.
 *
 * This function sets the color of a pixel at the specified x and y coordinates
 * in the video memory (VRAM) buffer.
 *
 * @param x The x-coordinate of the pixel.
 * @param y The y-coordinate of the pixel.
 * @param clr The color to set for the pixel.
 */
void drawPixel(int x, int y, COLOR clr)
{
    vid_mem[calc_pixel_location(x, y)] = clr;
}

/**
 * Draws a filled rectangle with the specified color.
 *
 * This function fills a rectangle with the specified color in the video memory (VRAM) buffer.
 * The rectangle is defined by its top-left and bottom-right coordinates.
 *
 * @param left The x-coordinate of the left edge of the rectangle.
 * @param top The y-coordinate of the top edge of the rectangle.
 * @param right The x-coordinate of the right edge of the rectangle.
 * @param bottom The y-coordinate of the bottom edge of the rectangle.
 * @param clr The color to fill the rectangle with.
 */
void drawRect(int left, int top, int right, int bottom, COLOR clr)
{
    uint32 width = right - left;
    uint32 height = bottom - top;

    for (int y = 0; y < height; ++y)
    {
        for (int x = 0; x < width; ++x)
        {
            drawPixel(left + x, top + y, clr);
        }
    }
}

/**
 * Draws a filled rectangle with the specified color.
 *
 * This function fills a rectangle with the specified color in the video memory (VRAM) buffer.
 * The rectangle is defined by its top-left coordinate, width, and height.
 *
 * @param left The x-coordinate of the left edge of the rectangle.
 * @param top The y-coordinate of the top edge of the rectangle.
 * @param width The width of the rectangle.
 * @param height The height of the rectangle.
 * @param clr The color to fill the rectangle with.
 */
void drawRect2(int left, int top, int width, int height, COLOR clr)
{
    for (int y = 0; y < height; ++y)
    {
        for (int x = 0; x < width; ++x)
        {
            drawPixel(left + x, top + y, clr);
        }
    }
}

/**
 * @brief Renders a string of text on the screen.
 *
 * This function renders a string of text starting from the specified position (x, y)
 * with the given text color. It iterates through each character in the string,
 * rendering them on the screen. Line breaks ('\n') are supported, and the text
 * will wrap to the next line.
 *
 * @param msg Pointer to the null-terminated string to render.
 * @param textCol Color of the text to render.
 * @param x X-coordinate of the starting position.
 * @param y Y-coordinate of the starting position.
 */
void drawString(char *msg, COLOR textCol, int x, int y)
{
    int c = *msg++;                               // Get the first character of the message.
    uint16 *dst = &vid_mem[y * SCREEN_WIDTH + x]; // Set the destination pointer to the starting position for rendering.

    while (c != '\0') // Loop until the end of the message string.
    {
        if (c == '\n') // Check if a line break is encountered.
        {
            dst += SCREEN_WIDTH * 8; // Move the destination pointer to the next line.
            x = 0;                   // Reset the x-coordinate for the new line.
        }
        else // Render normal characters.
        {
            uint32 row;
            uint8 *glyphBytes = (uint8 *)&fontTiles[2 * (c - 32)]; // Get the glyph data for the current character.

            for (int iy = 0; iy < 8; iy++) // Iterate over each row of the glyph.
            {
                row = glyphBytes[iy]; // Get the current row of the glyph.

                for (int ix = x; row > 0; row >>= 1, ix++) // Iterate over each pixel in the row.
                {
                    if (row & 1) // Check if the current pixel is set.
                    {
                        dst[(y + iy) * SCREEN_WIDTH + (x + ix)] = textCol; // Set the pixel color in the video memory.
                    }
                }
            }
            x += 4; // Move the x-coordinate to the next character position (advance by 4 pixels).
        }

        c = *msg++; // Get the next character in the message.
    }
}

/**
 * @brief Draws a sprite on the screen.
 *
 * This function draws a sprite at the specified position (x, y) on the screen.
 *
 * @param numb Index of the sprite to draw.
 * @param N Number of the sprite (assuming 8 bytes per sprite).
 * @param x X-coordinate of the top-left corner of the sprite.
 * @param y Y-coordinate of the top-left corner of the sprite.
 */

void drawSprite(int numb, int N, int x, int y)
{
    *(unsigned short *)(0x7000000 + 8 * N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8 * N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8 * N) = numb * 8;
}

// -----------------------------------------------------------------------------
// Input utility functions.
// -----------------------------------------------------------------------------
/**
 * @brief Polls the current state of the keyboard.
 *
 * This function updates the current and previous keyboard states by reading the hardware registers.
 *
 * @note It should be called regularly to ensure accurate keyboard state detection.
 */
inline void key_poll()
{
    key_prev = key_cur;
    key_cur = ~REG_KEYINPUT & KEY_MASK;
}

// State checks.
inline uint32 key_curr_state() { return key_cur; }
inline uint32 key_prev_state() { return key_prev; }
inline uint32 key_is_down(uint32 key) { return key_cur & key; }
inline uint32 key_is_up(uint32 key) { return ~key_cur & key; }
inline uint32 key_was_down(uint32 key) { return key_cur & key; }
inline uint32 key_was_up(uint32 key) { return ~key_cur & key; }

// -----------------------------------------------------------------------------
// Cell utility functions.
// -----------------------------------------------------------------------------
/**
 * @brief Gets the value of a cell in the game grid.
 *
 * @param x The X-coordinate of the cell.
 * @param y The Y-coordinate of the cell.
 * @return The value of the cell.
 */
uint8 getCellValue(int x, int y)
{
    return grid[y * NUM_CELLS_X + x];
}

/**
 * @brief Sets the value of a cell in the game grid.
 *
 * @param x The X-coordinate of the cell.
 * @param y The Y-coordinate of the cell.
 * @param value The value to set.
 */
void setCellValue(int x, int y, uint8 value)
{
    grid[y * NUM_CELLS_X + x] = value;
}

// -----------------------------------------------------------------------------
// Title utility functions.
// -----------------------------------------------------------------------------
/**
 * @brief Gets the current state of the title screen.
 *
 * @return The current state of the title screen.
 */
int getTitleScreenState()
{
    return state;
}

/**
 * @brief Initializes the title screen.
 *
 * This function sets up the initial state and draws the title screen.
 */
void beginTitleScreen()
{
    state = TITLE_PLAYING;
    drawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, COL_LIME);
    drawString("GBA SNAKE", COL_BLACK, 40, 40);
}

/**
 * @brief Handles input during the title screen.
 *
 * This function checks for input during the title screen and updates the game state accordingly.
 */
void handleTitleInput()
{
    if (key_curr_state() != key_prev_state())
    {
        if (key_is_down(KEY_START))
        {
            state = TITLE_END;
        }
    }
}

// -----------------------------------------------------------------------------
// Game utility functions.
// -----------------------------------------------------------------------------
/**
 * @brief Gets the current game state.
 *
 * @return The current game state.
 */
int getGameState()
{
    return gameState;
}

/**
 * @brief Gets the final score of the game.
 *
 * @return The final score of the game.
 */
int getFinalScore()
{
    return snake.length;
}

/**
 * @brief Updates and draws the game.
 *
 * This function performs the game logic, updates the game state, and draws the game on the screen.
 */
void tickAndDrawGame()
{
    // Game over if snake head goes out of bounds.
    if (snake.head.x > NUM_CELLS_X - 1 || snake.head.x < 0 || snake.head.y > NUM_CELLS_Y - 1 || snake.head.y < 0)
    {
        gameState = STATE_LOST;
        return;
    }

    // Check for win conditions.
    if (snake.length == NUM_CELLS_Y * NUM_CELLS_X)
    {
        gameState = STATE_WON;
        return;
    }

    // Handle collision with target node.
    if (snake.head.x == targetNode.x && snake.head.y == targetNode.y)
    {
        AddNode(&snake);
        AddNode(&snake);

        spawnTargetNode();
    }

    // Clear the tail cell.
    drawRect2(gridStart + snake.tail->x * SIZE_CELL,
              gridStart + snake.tail->y * SIZE_CELL,
              SIZE_CELL, SIZE_CELL, COL_BLACK);

    setCellValue(snake.tail->x, snake.tail->y, 0);

    // Update snake position.
    if (!UpdateSnake(&snake))
    {
        gameState = STATE_LOST;
        return;
    }

    // Draw snake head
    drawRect2(gridStart + snake.head.x * SIZE_CELL,
              gridStart + snake.head.y * SIZE_CELL,
              SIZE_CELL, SIZE_CELL, COL_WHITE);

    setCellValue(snake.head.x, snake.head.y, 1);
}

/**
 * @brief Renders the game.
 *
 * This function initializes the game and draws the initial state.
 */
void renderGame()
{
    spawnTargetNode();
}

/**
 * @brief Restarts the game.
 *
 * This function resets the game state, initializes the grid, and redraws the game elements.
 */
void restartGame()
{
    gameState = STATE_PLAYING;
    memset(&grid[0], 0, sizeof(uint8) * NUM_CELLS_Y * NUM_CELLS_X);

    int snakeStartX = NUM_CELLS_X / 2 - 1;
    int snakeStartY = NUM_CELLS_Y / 2 - 1;
    InitSnake(&snake, snakeStartX, snakeStartY, NUM_CELLS_Y * NUM_CELLS_X);

    // Clear screen.
    drawRect2(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, COL_BLACK);

    // Redraw frame.
    const int PS = SIZE_PADDING + SIZE_FRAME;
    const int FRAME_RIGHT = SCREEN_WIDTH - PS;
    const int FRAME_LEFT = SIZE_PADDING;
    const int FRAME_TOP = SIZE_PADDING;
    const int FRAME_HEIGHT = SCREEN_HEIGHT - PS;
    drawRect2(FRAME_LEFT, FRAME_TOP, SCREEN_WIDTH - (SIZE_PADDING) * 2, SIZE_FRAME, COL_LIME);
    drawRect2(FRAME_RIGHT, FRAME_TOP, SIZE_FRAME, SCREEN_HEIGHT - SIZE_PADDING * 2, COL_LIME);
    drawRect2(FRAME_LEFT, FRAME_TOP, SIZE_FRAME, SCREEN_HEIGHT - SIZE_PADDING * 2, COL_LIME);
    drawRect2(FRAME_LEFT, FRAME_HEIGHT, SCREEN_WIDTH - SIZE_PADDING * 2, SIZE_FRAME, COL_LIME);
    // Spawn target node.
    spawnTargetNode();
}

/**
 * @brief Spawns a target node in the game grid.
 *
 * This function randomly selects a location in the grid and draws a target node (apple) there.
 */
/**
 * @brief Spawns a target node (apple) in the game grid.
 *
 * This function randomly selects a location in the grid where there is no existing snake body segment,
 * and places a target node (apple) there. It updates the targetNode struct and draws the apple sprite
 * at the corresponding location on the screen.
 */
void spawnTargetNode()
{
    // Initialize variables to store the target node's coordinates and the last random value.
    int tX = -1;
    int tY = -1;
    int lastR = -1;

    // Loop through each cell in the grid.
    for (int y = 0; y < NUM_CELLS_Y; ++y)
    {
        for (int x = 0; x < NUM_CELLS_X; ++x)
        {
            // Generate a random value.
            int r = ha_rand();

            // Check if the current cell is empty (no snake body segment).
            if (grid[y * NUM_CELLS_X + x] != 1)
            {
                // If it's the first eligible cell or the random value is greater than the last one.
                if (tY == -1 || (r > lastR))
                {
                    // Update the target node's coordinates.
                    tY = y;
                    tX = x;
                    // Update the last random value.
                    lastR = r;
                }
            }
        }
    }

    // Set the target node's coordinates.
    targetNode.x = tX;
    targetNode.y = tY;

    // Draw the target node (apple) on the screen at the corresponding location.
    drawRect2(gridStart + tX * SIZE_CELL,
              gridStart + tY * SIZE_CELL,
              SIZE_CELL, SIZE_CELL, COL_RED);

    // Draw the apple sprite at the target node's location.
    drawSprite(0, 4, gridStart + tX * SIZE_CELL, gridStart + tY * SIZE_CELL);
}

/**
 * @brief Handles input during the game.
 *
 * This function checks for user input during the game and updates the game state accordingly.
 */
/**
 * @brief Handles input during the game state.
 *
 * This function checks for user input and updates the snake's velocity and game state accordingly.
 * If the user presses directional keys (UP, DOWN, LEFT, RIGHT), it updates the snake's velocity
 * to move in the corresponding direction. If the user presses the SELECT key, it toggles the game
 * between playing and paused states.
 */
void handleGameInput()
{
    if (key_curr_state() != key_prev_state())
    {
        if (key_is_down(KEY_SELECT))
        {
            if (state == STATE_PAUSE)
            {
                // Resuming the game
                state = STATE_GAME;
                // Restore previous velocity
                snake.xVel = snake.lastXMov;
                snake.yVel = snake.lastYMov;
            }
            else
            {
                // Pausing the game
                // Store last movements
                snake.lastXMov = snake.xVel;
                snake.lastYMov = snake.yVel;
                // Stop movement
                UpdateVelocityX(&snake, SNAKE_STOPPED);
                UpdateVelocityY(&snake, SNAKE_STOPPED);
                state = STATE_PAUSE;
            }
        }
        // Ensure no other inputs are processed if paused
        if (state != STATE_PAUSE)
        {
            if (key_is_down(KEY_RIGHT))
            {
                UpdateVelocityX(&snake, SNAKE_RIGHT);
                currentDirection = RIGHT;
            }
            else if (key_is_down(KEY_LEFT))
            {
                UpdateVelocityX(&snake, SNAKE_LEFT);
                currentDirection = LEFT;
            }
            else if (key_is_down(KEY_UP))
            {
                UpdateVelocityY(&snake, SNAKE_UP);
                currentDirection = UP;
            }
            else if (key_is_down(KEY_DOWN))
            {
                UpdateVelocityY(&snake, SNAKE_DOWN);
                currentDirection = DOWN;
            }
        }
    }
}

/**
 * @brief Sets the match result.
 *
 * @param didPlayerWin A flag indicating whether the player won or lost the game.
 */
void SetMatchResult(int didPlayerWin)
{
    result = didPlayerWin;
}

/**
 * @brief Initializes the game over screen.
 *
 * This function sets up the game over screen based on the match result and draws appropriate messages.
 */
void beginGameOverScreen()
{
    state = END_PLAYING;

    if (result)
    {
        drawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, COL_BLACK);
        drawString("A WINNER IS YOU", COL_LIME, 25, 25);
        drawString("Press Start To Retry ", COL_LIME, 13, 35);
    }
    else
    {
        drawRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, COL_RED);
        drawString("You Lost", COL_BLACK, 25, 25);
        drawString("Press Start To Retry ", COL_BLACK, 13, 35);
    }
}

/**
 * @brief Handles input during the game over screen.
 *
 * This function checks for input during the game over screen and updates the game state accordingly.
 */
void handleGameOverInput()
{
    if (key_curr_state() != key_prev_state())
    {
        if (key_is_down(KEY_START))
        {
            state = END_RESTART;
        }
    }
}

/**
 * @brief Gets the current state of the game over screen.
 *
 * @return The current state of the game over screen.
 */
int getGameOverState()
{
    return state;
}

// -----------------------------------------------------------------------------
// Snake functions.
// -----------------------------------------------------------------------------
/**
 * @brief Initializes the snake object.
 *
 * @param snake Pointer to the snake object to initialize.
 * @param startX Initial X coordinate of the snake's head.
 * @param startY Initial Y coordinate of the snake's head.
 * @param maxLen Maximum length of the snake.
 */
void InitSnake(Snake *snake, int startX, int startY, int maxLen)
{
    snake->head.x = startX;
    snake->head.y = startY;
    snake->length = 1;
    snake->xVel = SNAKE_RIGHT;
    snake->yVel = SNAKE_STOPPED;
    snake->lastXMov = SNAKE_RIGHT;
    snake->lastYMov = SNAKE_STOPPED;

    snake->tail = &snake->head;
    snake->tail->prev = NULL;

    memset(&snake->freeNodes[0], 0, sizeof(SnakeNode) * NUM_CELLS_X * NUM_CELLS_Y);
}

/**
 * @brief Updates the snake's position and checks for collisions.
 *
 * @param s Pointer to the snake object.
 * @return Returns 0 if the snake collides with itself, otherwise returns 1.
 */
int UpdateSnake(Snake *s)
{
    if (state == STATE_PAUSE)
    {
        return 1; // Do not update the snake if the game is paused
    }

    SnakeNode *curNode = s->tail;

    while (curNode != NULL)
    {
        SnakeNode *prev = curNode->prev;
        if (prev != NULL)
        {
            curNode->x = prev->x;
            curNode->y = prev->y;
            curNode = curNode->prev;
        }
        else
        {
            int newX = curNode->x + (s->xVel - 1);
            int newY = curNode->y + (s->yVel - 1);

            // Check for self-collision.
            if (getCellValue(newX, newY))
            {
                return 0;
            }

            curNode->x = newX;
            curNode->y = newY;

            s->lastXMov = (s->xVel);
            s->lastYMov = (s->yVel);
            setCellValue(newX, newY, 1);

            break;
        }
    }
    return 1;
}

/**
 * @brief Adds a new node to the snake.
 *
 * @param s Pointer to the snake object.
 */
void AddNode(Snake *s)
{
    SnakeNode *newTail = &s->freeNodes[s->length - 1];
    newTail->x = s->tail->x;
    newTail->y = s->tail->y;
    newTail->prev = s->tail;
    s->tail = newTail;
    s->length++;
}

/**
 * @brief Draws a loose node of the snake.
 *
 * @param n Pointer to the loose node.
 * @param gridOffset Offset of the grid.
 * @param nodeSize Size of the node.
 */
void DrawLooseNode(SnakeNode *n, int gridOffset, int nodeSize)
{
    drawRect2(gridOffset + n->x * nodeSize,
              gridOffset + n->y * nodeSize,
              nodeSize, nodeSize, COL_YELLOW);
}

/**
 * @brief Clears a loose node of the snake.
 *
 * @param n Pointer to the loose node.
 * @param gridOffset Offset of the grid.
 * @param nodeSize Size of the node.
 */
void ClearLooseNode(SnakeNode *n, int gridOffset, int nodeSize)
{
    drawRect2(gridOffset + n->x * nodeSize,
              gridOffset + n->y * nodeSize,
              nodeSize, nodeSize, COL_BLACK);
}

/**
 * @brief Checks if the snake head collides with a specific node.
 *
 * @param s Pointer to the snake object.
 * @param node Pointer to the node to check collision with.
 * @return Returns 1 if collision occurs, otherwise returns 0.
 */
int IsCollidingWithNode(Snake *s, SnakeNode *node)
{
    return s->head.x == node->x && s->head.y == node->y;
}

/**
 * @brief Updates the snake's horizontal velocity.
 *
 * @param s Pointer to the snake object.
 * @param vel New velocity value.
 */
void UpdateVelocityX(Snake *s, int vel)
{
    if (s->lastXMov == SNAKE_STOPPED)
    {
        s->xVel = vel;
        s->yVel = SNAKE_STOPPED;
    }
}

/**
 * @brief Updates the snake's vertical velocity.
 *
 * @param s Pointer to the snake object.
 * @param vel New velocity value.
 */
void UpdateVelocityY(Snake *s, int vel)
{
    if (s->lastYMov == SNAKE_STOPPED)
    {
        s->xVel = SNAKE_STOPPED;
        s->yVel = vel;
    }
}

// -----------------------------------------------------------------------------
// Other utility functions.
// -----------------------------------------------------------------------------
/**
 * @brief Sets a block of memory to a specified value.
 *
 * @param ptr Pointer to the memory block to set.
 * @param value The value to set.
 * @param num Number of bytes to set.
 * @return Pointer to the memory block.
 */
void *memset(void *ptr, int value, size_t num)
{
    unsigned char *p = ptr;
    while (num--)
    {
        *p++ = (unsigned char)value;
    }
    return ptr;
}

/**
 * @brief Generates a pseudo-random number.
 *
 * This function implements a simple pseudo-random number generator.
 *
 * @return A pseudo-random number.
 */
int ha_rand(void)
{
    next = next * 1103515245 + 12345;
    return (unsigned int)(next / 65536) % 32768;
}