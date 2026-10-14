# FPGA Hardware Command Parser (UART)

## Overview
This project implements a hardware-level command-line interface via RS-232 UART. The FPGA receives 3-byte packets (Command, Address, Data) at 115200 baud and executes memory-mapped write operations to an internal 16-byte register bank. 

## Hardware Specifications
*   **Target Board:** Altera DE2-115 (EP4CE115F29C7)
*   **Clock Domain:** 50 MHz
*   **Protocol:** UART (8N1) at 115200 Baud

## System Architecture
*   `uart_register_ctrl.v`: Top-level FSM that synchronizes byte reception, decodes the `0x57` ('W') write command, and updates the targeted register address.
*   **Pin Mapping:** `rx_byte` is mapped to the DE2-115 GPIO_0 expansion header to safely interface with external serial transceivers.

## Synthesis Results
*(Populate from Quartus Compilation Report)*
*   **Logic Elements (LEs):** 
*   **Registers:** 
*   **Fmax (Slow 1200mV 85C Model):** 
