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
#define END_RESTART2 2
#define SNAKE_LEFT 0
#define SNAKE_RIGHT 2
#define SNAKE_UP 0
#define SNAKE_DOWN 2
#define LEFT 0
#define RIGHT 1
#define UP 2
#define DOWN 3
#define SNAKE_STOPPED 1
#define NUM_CELLS_X 28
#define NUM_CELLS_Y 18
#define SIZE_CELL 8
#define SIZE_FRAME 2
#define SIZE_PADDING 6
#define STATE_PLAYING 0
#define STATE_WON 1
#define STATE_LOST 2
#define STATE_JUST_LAUNCHED 0
#define STATE_TITLE 1
#define STATE_GAME 2
#define STATE_END 3
#define STATE_PAUSE 4
#define spriteData ((unsigned short *)0x6010000)
#define spritePal ((unsigned short *)0x5000200)
;

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
int lvl2 = 0;

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
void restartGame2();
void beginGameOverScreen();
void spawnTargetNode();
uint8 getCellValue(int x, int y);
void drawSprite(int numb, int N, int x, int y);
void setCellValue(int x, int y, uint8 value);
void drawRect2(int left, int top, int width, int height, COLOR clr);
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
    // Set Mode 2
    *(unsigned short *)0x4000000 = 0x40 | 0x2 | 0x1000;

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
                    lvl2 = 0;
                }
                if (currentState == END_RESTART2)
                {
                    lvl2 = 1;
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

void fillPalette(void)
{
    int i;
    // Fill the palette in GBA memory
    for (i = 0; i < NCOLS; i++)
        spritePal[i] = palette[i];
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
    *(unsigned short *)(0x7000002 + 8 * N) = x;
    *(unsigned short *)(0x7000004 + 8 * N) = numb * 2;
}

void fillSprites(void)
{
    int i;
    // Load all sprites in GBA memory
    for (i = 0; i < 128 * 16 * 16; i++)
        spriteData[i] = (sprites[i * 2 + 1] << 8) + sprites[i * 2];

    // draw all sprites on screen, but all of them outside of the screen (starting at position (240,160) the bottom right corner of the GBA screen)
    for (i = 0; i < 128; i++)
        drawSprite(0, i, 240, 160);
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
    int i;
    state = TITLE_PLAYING;
    fillPalette();
    fillSprites();
    // display SNAKE title
    for (i = 0; i < 5; i++)
    {
        drawSprite(i, 48 + i, 80 + (i * 8), 80);
    }
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

    // Check for win conditions for lvl 1
    if (snake.length >= 8 && (!lvl2))
    {
        gameState = STATE_WON;
        result = snake.length;
        return;
    }

    // Check for win conditions for lvl 2
    if (snake.length >= 16 && (lvl2))
    {
        gameState = STATE_WON;
        result = snake.length;
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
    drawSprite(16, 64, gridStart + snake.tail->x * SIZE_CELL + 8, gridStart + snake.tail->y * SIZE_CELL + 8);

    setCellValue(snake.tail->x, snake.tail->y, 0);

    // Update snake position.
    if (!UpdateSnake(&snake))
    {
        gameState = STATE_LOST;
        return;
    }

    // Draw snake body
    int spriteNum = 17;
    int sprite_index = 90;
    SnakeNode *currentNode = snake.tail;
    while (currentNode != NULL)
    {
        drawSprite(spriteNum, sprite_index++, gridStart + currentNode->x * SIZE_CELL, gridStart + currentNode->y * SIZE_CELL);
        currentNode = currentNode->prev;
    }

    // Draw snake head
    drawSprite(17, 66, gridStart + snake.head.x * SIZE_CELL, gridStart + snake.head.y * SIZE_CELL);

    setCellValue(snake.head.x, snake.head.y, 1);
}

/**
 * @brief Renders the game.
 *
 * This function initializes the game and draws the initial state.
 */
void renderGame()
{
    fillPalette();
    fillSprites();
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
    fillPalette();
    fillSprites();
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
    // Draw the target node (food) on the screen at the corresponding location.
    drawSprite(15, 63, gridStart + tX * SIZE_CELL, gridStart + tY * SIZE_CELL);
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
 * @brief Initializes the game over screen.
 *
 * This function sets up the game over screen based on the match result and draws appropriate messages.
 */
void beginGameOverScreen()
{
    int i;
    state = END_PLAYING;

    if ((result >= 16) && lvl2)
    {
        // Display "YOU WON LV2"
        fillPalette();
        fillSprites();
        int you_text[] = {5, 6, 7};
        int won_text[] = {8, 9, 10};
        int LV2_text[] = {18, 19, 21};
        for (i = 0; i < 3; i++)
        {
            drawSprite(you_text[i], 0 + i, 70 + (i * 8), 80);
        }
        for (i = 0; i < 3; i++)
        {
            drawSprite(won_text[i], 5 + i, 102 + (i * 8), 80);
        }
        for (i = 0; i < 3; i++)
        {
            drawSprite(LV2_text[i], 10 + i, 134 + (i * 8), 80);
        }
    }

    else if ((result >= 8) && !lvl2)
    {
        // Display "YOU WON LV1"
        fillPalette();
        fillSprites();
        int you_text[] = {5, 6, 7};
        int won_text[] = {8, 9, 10};
        int LV1_text[] = {18, 19, 20};
        for (i = 0; i < 3; i++)
        {
            drawSprite(you_text[i], 0 + i, 70 + (i * 8), 80);
        }
        for (i = 0; i < 3; i++)
        {
            drawSprite(won_text[i], 5 + i, 102 + (i * 8), 80);
        }
        for (i = 0; i < 3; i++)
        {
            drawSprite(LV1_text[i], 10 + i, 134 + (i * 8), 80);
        }
    }
    else
    {
        // Display "YOU LOST"
        fillPalette();
        fillSprites();
        int you_text[] = {5, 6, 7};
        int lost_text[] = {11, 12, 13, 14};
        for (i = 0; i < 3; i++)
        {
            drawSprite(you_text[i], 0 + i, 70 + (i * 8), 80);
        }
        for (i = 0; i < 4; i++)
        {
            drawSprite(lost_text[i], 5 + i, 102 + (i * 8), 80);
        }
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
        // Go to lvl 2
        if (key_is_down(KEY_START) && (result >= 8))
        {
            lvl2 = 1;
            result = 0;
            state = END_RESTART2;
            return;
        }
        // Restart lvl 1
        if (key_is_down(KEY_START))
        {
            lvl2 = 0;
            result = 0;
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
