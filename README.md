# GBA Snake Game
This repository contains the source code for a classic Snake game implemented on the Game Boy Advance (GBA) using the C programming language. This project leverages the unique hardware capabilities of the GBA, providing a simple yet engaging gaming experience.

## Features
- Classic Gameplay: Navigate the snake around the screen, eating apples to grow longer while avoiding walls and your own tail.
- Graphics and Controls: Utilizes the GBA's graphics hardware for rendering and supports responsive button-based controls.
- Multiple Game States: Includes title screen, gameplay, pause, and game over states with the ability to restart after losing.
- Custom Font Rendering: Displays score and messages using a custom bitmap font.

## Getting Started
To build and run this game, you will need the following:

- DevkitPro with GBA development tools installed.
- GBA Emulator (mGBA or VisualBoyAdvance recommended) or a physical GBA device with a flash cartridge.

## Building the Project
1. Clone the repository to your local machine.
2. Navigate to the project directory.
3. Run `make` to build the game.
4. Load the resulting .gba file into an emulator or onto a flash cartridge.

## Acknowledgments
Special thanks to Kevin Halladay for inspiring the development of this GBA Snake game. You can find more about his original work at [GBASnake](https://github.com/khalladay/GBASnake).