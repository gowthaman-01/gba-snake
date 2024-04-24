.global calc_pixel_location


@ Calculates the pixel location in VRAM based on the given x and y coordinates.
 
calc_pixel_location:
    MOV     r2, #240            @ Load the constant SCREEN_WIDTH into r2

    MUL     r1, r1, r2          @ Calculate y * SCREEN_WIDTH
    ADD     r0, r1, r0          @ Calculate y * SCREEN_WIDTH + x
	 BX      LR

