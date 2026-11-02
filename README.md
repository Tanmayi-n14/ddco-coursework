# ⚡ Digital Design & Computer Organization (DDCO)

Complete digital logic, Verilog hardware description language (HDL), and computer organization coursework developed during **3rd Semester B.Tech Computer Science and Engineering**.

All modules are implemented in standard Verilog HDL and verified using **Icarus Verilog (`iverilog`)** and **GTKWave**.

---

## 📂 Repository Structure

```text
ddco-coursework/
├── lab-02-basic-circuits/
│   ├── circuit1.v / circuit1_tb.v
│   ├── circuit2.v / circuit2_tb.v
│   ├── simple_circuit.v / simple_circuit_tb.v
│   └── *.png (GTKWave waveforms)
├── lab-03-adders/
│   ├── halfadd.v / halfadd_tb.v
│   ├── basicfa.v / basicfa_tb.v
│   └── *.png (GTKWave waveforms)
├── lab-04-combinational-logic/
│   ├── rca.v / rca_tb.v                 # 4-bit Ripple Carry Adder
│   ├── mux4.v / mux4_tb.v               # 4:1 Multiplexer
│   ├── enc4.v / enc4_tb.v               # 4:2 Priority Encoder
│   ├── decoder.v / decoder_tb.v         # 2:4 Decoder with Enable
│   └── *.png (GTKWave waveforms)
├── lab-05-flip-flops/
│   ├── D_ff.v / D_ff_tb.v               # D Flip-Flop
│   ├── jk_ff.v / jk_ff_tb.v             # JK Flip-Flop
│   ├── t_ff.v / t_ff_tb.v               # T Flip-Flop
│   └── *.png (GTKWave waveforms)
├── lab-06-counters/
│   ├── up_counter.v / tb_up.v           # 2-bit Synchronous Up Counter
│   ├── down_counter.v / tb_down.v       # 2-bit Synchronous Down Counter
│   └── *.png (GTKWave waveforms)
├── lab-07-16bit-alu/
│   ├── lib.v                            # Gate primitives (xor3, and2, or3, mux2)
│   ├── alu.v                            # 16-Bit Arithmetic Logic Unit (Add, Sub, AND, OR)
│   ├── tb_alu.v                         # Testbench verifying all 4 operations
│   └── alu_waveform.png
├── lab-08-register-file-alu/
│   ├── reg_alu.v                        # 8x16-Bit Register File with Dual Read Ports & Write Decoder
│   ├── tb_reg_alu.v                     # Verification testbench
│   └── reg_alu_waveform.png
├── assignment-orange-level-1-vending-machine/
│   ├── vending_machine.v                # FSM-based Vending Machine controller
│   ├── tb_vm.v                          # Testbench
│   ├── test_runner.py                   # Automated Python verification
│   └── vending_machine_report.docx      # Assignment report
├── assignment-orange-level-2-circuits/
│   ├── orange_level_ddco_2.circ         # Logisim circuit design
│   └── orange_problem_2_report.docx     # Assignment report
└── project-ring-and-johnson-counters/
    ├── ring_counter.v                   # 4-bit Ring Counter
    ├── johnson_counter.v                # 4-stage Switch-Tail Johnson Counter
    ├── ring_johnson_tb.v                # Simulation testbench
    ├── project_report.docx              # Team project documentation
    └── *.png (Schematic circuit diagrams)
```

---

## 🛠️ Simulation & Verification Guide

All Verilog designs can be compiled and simulated using **Icarus Verilog** and **GTKWave**:

### 1. Compile
```bash
iverilog -o sim_test <design_file>.v <testbench_file>.v
```

### 2. Run Simulation
```bash
vvp sim_test
```
*This generates a `.vcd` (Value Change Dump) file and outputs the simulation logs.*

### 3. View Waveforms in GTKWave
```bash
gtkwave <dumpfile>.vcd
```

---

## 📜 Key Highlights

1. **16-Bit ALU (`lab-07-16bit-alu`)**:
   - Bit-slice structural architecture (`alu_slice`) chained across 16 bits with carry propagation.
   - Supports 4 operations: `ADD`, `SUB`, `AND`, `OR`.
2. **16-Bit Register File (`lab-08-register-file-alu`)**:
   - 8 general-purpose 16-bit registers with individual load enable lines.
   - Dual asynchronous read ports (`rd_addr_a`, `rd_addr_b`) via 8:1 multiplexers and synchronous write port.
3. **FSM Vending Machine (`assignment-orange-level-1`)**:
   - Behavioral Finite State Machine handling coin inputs, state transitions, item dispense, and change return.
4. **Ring & Johnson Counters (`project-ring-and-johnson-counters`)**:
   - Synchronous shift-register counters verifying circular high-bit shifting and 8-state switch-tail sequences.

---

## 👩‍💻 Author
- **Tanmayi-n14**
