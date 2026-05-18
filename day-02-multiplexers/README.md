# Day 02 - Multiplexers

## Overview
This project implements different types of multiplexers in Verilog HDL as part of the **30-Day RTL Design Challenge**.

Multiplexers are fundamental combinational logic blocks widely used in digital systems for data routing and selection.

---

## Implemented Modules

### 1. 2:1 Multiplexer
- Selects one of two inputs based on a single select line.
- Exhaustive verification performed (all 8 combinations).

### 2. 4:1 Multiplexer
- Selects one of four inputs using a 2-bit select signal.
- Exhaustive verification performed (64 combinations).

### 3. 8:1 Multiplexer
- Selects one of eight inputs using a 3-bit select signal.
- Functional verification performed for all select paths.

### 4. Parameterized 4:1 Multiplexer
- Configurable data width using Verilog parameter.
- Demonstrates reusable RTL design.
- Functional verification performed using 8-bit bus inputs.

---

## Files Included

```text
mux_2x1.v
mux_2x1_tb.v
mux_4x1.v
mux_4x1_tb.v
mux_8x1.v
mux_8x1_tb.v
mux_param.v
mux_param_tb.v
mux_2x1_waveform.png
mux_4x1_waveform.png
mux_8x1_waveform.png
mux_param_waveform.png
README.md