# Project: Traffic Light System Implementation

---

## Introduction
This project aims to design, simulate, and implement a traffic light system using Verilog and FPGA technology. The system simulates real-world traffic light behavior at an intersection, controlled by sensors placed on two roads. By following a Moore machine model and utilizing FPGA resources, the project demonstrates the functionality on a hardware platform.

---

## Project Components

1. **Design and Simulation:**
   - Developed Verilog module for the traffic light system.
   - Implemented a testbench using Verilog Test Fixture in Xilinx ISE for simulation.
   - Observed the behavior of LA and LB traffic lights based on sensor inputs.

2. **FPGA Implementation:**
   - Coded Verilog module implemented on FPGA for real-time demonstration.
   - Adjusted clock speed to 3 seconds to visualize light changes effectively.
   - Used LEDs on BASYS3 board to display LA and LB traffic lights.
   - Mapped SA and SB sensors to leftmost buttons, activating when set to 1.
   - Tested the functionality independently.

## License
This project is licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0/).
