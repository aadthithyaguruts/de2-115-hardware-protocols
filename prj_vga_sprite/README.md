# Hardware Bouncing Sprite Engine (VGA)

## Overview
A real-time display controller that drives a VGA monitor at 640x480 resolution (60 Hz). The physics engine calculates object boundaries and velocity vectors entirely in combinational and sequential hardware logic, generating a bouncing 32x32 pixel solid block without a soft-core processor.

## Hardware Specifications
*   **Target Board:** Altera DE2-115 (EP4CE115F29C7)
*   **Pixel Clock:** 25 MHz
*   **Output:** 24-bit RGB (8 bits per color channel via ADV7123 DAC)

## System Architecture
*   `vga_sprite_physics.v`: Evaluates coordinate boundaries against the 640x480 grid during the vertical blanking interval (`vsync`) to reverse direction upon collision.

## Synthesis Results
*(Populate from Quartus Compilation Report)*
*   **Logic Elements (LEs):** 
*   **Fmax:** 
