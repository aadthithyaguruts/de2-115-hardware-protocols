# Fully Connected Layer MAC Accelerator

## Overview
A Multiply-Accumulate (MAC) processing element designed for a Neural Network systolic array. It performs the core dot-product computation of an input activation against a trained weight, operating on 8-bit signed integers and accumulating into a 32-bit signed register to prevent overflow.

## Hardware Specifications
*   **Target Board:** Altera DE2-115 (EP4CE115F29C7)
*   **Data Types:** 8-bit signed input, 32-bit signed accumulator
*   **DSP Utilization:** Designed to infer dedicated embedded 18x18 multiplier blocks.

## System Architecture
*   `fc_mac_element.v`: Executes synchronous multiplication and accumulation. Features clear and enable control signals for orchestration by a higher-level layer controller.

## Synthesis Results
*(Populate from Quartus Compilation Report)*
*   **Embedded 9-bit Multipliers:** 
*   **Logic Elements (LEs):** 
*   **Fmax:** 
