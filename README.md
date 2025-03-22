# fsm
# Pair Detect FSM - Verilog Implementation

## Overview
This project implements a **Finite State Machine (FSM)** in Verilog to detect consecutive pairs of `1`s in a serial bit stream. The FSM transitions between states based on the input bit (`inbits`) and sets an output signal (`detect`) when a pair of consecutive `1`s is detected.

## Files in the Project
- `pair_detect.v` - Verilog module implementing the FSM
- `testbench.v` - Testbench for simulating and verifying FSM behavior
- `pair_detect_tb.vcd` - Generated waveform file for analysis in GTKWave (after running simulation)
- `README.md` - Project documentation

## FSM Description
### Inputs:
- `clk` (Clock signal)
- `inbits` (Serial input bit stream)
- `reset` (Asynchronous reset signal)

### Output:
- `detect` (High when two consecutive `1`s are detected)

### State Transitions:
| **Current State** | **inbits = 0** | **inbits = 1** |
|------------------|---------------|---------------|
| `00` (Initial)  | → `10`        | → `01`        |
| `01`            | → `10`        | → `11`        |
| `10`            | → `11`        | → `01`        |
| `11`            | → `10`        | → `01`        |

The FSM sets `detect = 1` when it reaches state `11`.

## Simulation Instructions
### 1. Install Icarus Verilog and GTKWave
If not installed, run the following:
```
sudo apt-get install iverilog gtkwave  # Ubuntu/Linux
brew install icarus-verilog            # macOS (via Homebrew)
```

### 2. Compile the Verilog Code
```
iverilog -o pair_detect_tb pair_detect.v testbench.v
```

### 3. Run the Simulation
```
vvp pair_detect_tb
```
This generates the `pair_detect_tb.vcd` file.

### 4. View the Waveform in GTKWave
```
gtkwave pair_detect_tb.vcd
```
- Add signals `clk_tb`, `inbits_tb`, `reset_tb`, `detect` to observe the FSM behavior.
- Check when `detect` becomes `1` based on input patterns.

## Expected Testbench Behavior
- `reset` initializes the FSM to state `00`.
- `detect` is set to `1` when `inbits_tb` has consecutive `1`s.
- The waveform should match the expected state transitions.

## Further Enhancements
- Modify FSM to detect different patterns (e.g., `101` sequences).
- Add more test cases for edge conditions.
- Implement synthesis for FPGA deployment.
