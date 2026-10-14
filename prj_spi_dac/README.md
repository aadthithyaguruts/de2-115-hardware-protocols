# SPI Dual-Channel DAC Waveform Generator

## Overview
This hardware module interfaces with an external MCP4922 SPI Digital-to-Analog Converter (DAC). It transmits 16-bit frames (4 configuration bits + 12 data bits) via SPI Mode 0 to generate analog waveforms.

## Hardware Specifications
*   **Target Board:** Altera DE2-115 (EP4CE115F29C7)
*   **Clock Domain:** 50 MHz system clock
*   **Protocol:** SPI (Mode 0: CPOL=0, CPHA=0)

## System Architecture
*   `spi_dac_tx.v`: Triggers on a sample tick, asserting `cs_n` low, shifting the 16-bit payload out on the `mosi` line on the falling edge of `sclk`, and latching on the rising edge.

## Synthesis Results
*(Populate from Quartus Compilation Report)*
*   **Logic Elements (LEs):** 
*   **Fmax:** 
