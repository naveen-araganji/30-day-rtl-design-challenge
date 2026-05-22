# Day 06 - Subtractors

## Overview
This project implements subtractor designs in Verilog HDL.

Subtractors are fundamental arithmetic building blocks widely used in digital systems for binary subtraction, comparison logic, arithmetic operations, and ALU datapath design.

---

## Implemented Modules

### 1. Half Subtractor
- Performs subtraction of two 1-bit inputs.
- Generates difference and borrow outputs.
- Exhaustive verification performed (all 4 combinations).

### 2. Full Subtractor
- Performs subtraction of two 1-bit inputs with borrow-in.
- Implemented structurally using two half subtractors.
- Generates difference and borrow-out outputs.
- Exhaustive verification performed (all 8 combinations).

### 3. 4-bit Adder-Subtractor
- Performs 4-bit addition and subtraction using mode control.
- Implemented structurally using full adders.
- Demonstrates two’s complement arithmetic and arithmetic operation selection.
- Functional verification performed using addition, subtraction, carry, zero-result, and boundary test cases.

---

## Dependencies
- `adder_subtractor_4bit.v` instantiates the `full_adder` module from Day 05.
- `full_adder` internally instantiates the `half_adder` module.
- To simulate `adder_subtractor_4bit.v` in Vivado, include both `full_adder.v` and `half_adder.v` from the Day 05 folder as project sources.

---

## Files Included

```text
half_subtractor.v
half_subtractor_tb.v
full_subtractor.v
full_subtractor_tb.v
adder_subtractor_4bit.v
adder_subtractor_4bit_tb.v
half_subtractor_waveform.png
full_subtractor_waveform.png
adder_subtractor_4bit_waveform.png
README.md
```

---

## Waveforms

### Half Subtractor
![Half Subtractor](half_subtractor_waveform.png)

### Full Subtractor
![Full Subtractor](full_subtractor_waveform.png)

### 4-bit Adder-Subtractor
![4-bit Adder-Subtractor](adder_subtractor_4bit_waveform.png)