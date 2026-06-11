# Day 26 - UART Receiver

## Overview

This project implements a UART (Universal Asynchronous Receiver Transmitter) Receiver in Verilog HDL.

A UART Receiver receives serial data from a communication line, reconstructs the original parallel data, and indicates when valid data has been successfully received. UART communication is widely used in microcontrollers, processors, embedded systems, and FPGA-based communication interfaces.

This project was verified by connecting the UART Receiver with the UART Transmitter developed in Day 25.

---

## Implemented Module

### 1. UART Receiver

Features:

- Baud rate generator
- Start bit detection
- 8-bit data reception
- Stop bit verification
- Data valid indication
- FSM-based design
- LSB first reception

UART operations:

```text
Idle State    -> Wait for Start Bit
Start State   -> Detect Start Bit
Data State    -> Receive 8 Data Bits
Stop State    -> Verify Stop Bit
Valid State   -> Assert Data Valid Signal
```

---

## UART Receiver Architecture

Components used:

```text
Baud Generator
Finite State Machine (FSM)
Shift Register
Bit Counter
Data Register
Valid Signal Generator
```

Data flow:

```text
Serial Data (i_rx)
        |
        v
+----------------+
|    UART RX     |
+----------------+
        |
        v
Parallel Data (o_rx_data)
```

---

## Example Operation

UART frame received:

```text
Start Bit = 0

Data = A5

A5 = 10100101

LSB First:

1
0
1
0
0
1
0
1

Stop Bit = 1
```

Receiver output:

```text
o_rx_data  = A5
o_rx_valid = 1
```

---

## UART TX → UART RX Verification

The receiver was verified using the UART transmitter developed in Day 25.

Communication path:

```text
UART TX  ----->  UART RX
```

Transmission:

```text
TX Data = A5
```

Reception:

```text
RX Data = A5
```

Verification Status:

```text
PASS
```

---

## Files Included

```text
uart_rx.v

uart_tx.v

uart_tx_rx_tb.v

uart_tx_rx_waveform.png

README.md
```

---

## Waveforms

### UART Receiver

The waveform verifies:

![UART Receiver Waveform](uart_tx_rx_waveform.png)