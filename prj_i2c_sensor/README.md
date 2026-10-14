# I2C Temperature Sensor Controller

## Overview
A standalone I2C Master state machine that continuously polls an external LM75/I2C temperature sensor. The core manages START/STOP conditions, ACKs/NACKs, and standard 100 kHz clock generation via an open-drain SDA interface.

## Hardware Specifications
*   **Target Board:** Altera DE2-115 (EP4CE115F29C7)
*   **Clock Domain:** 100 kHz (Derived via PLL/Divider)
*   **Protocol:** I2C Standard Mode (100 kbps)

## System Architecture
*   `i2c_temp_reader.v`: Implements the 9-state Moore machine (IDLE -> START -> ADDR -> ACK1 -> READ_MSB -> ACK2 -> READ_LSB -> NACK -> STOP).
*   **SDA Buffer:** Implements a tristate buffer to support the bidirectional open-drain requirement of the I2C bus.

## Synthesis Results
*(Populate from Quartus Compilation Report)*
*   **Logic Elements (LEs):** 
*   **Fmax:** 
