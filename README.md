# Digital Design with SystemVerilog

## Introduction
A central processing unit (CPU) shown below was designed and simulated in this digital design lab. Code was written in SystemVerilog, simulated using Icarus Verilog and the simulation waveforms plotted using GTKWave. 

The implemented components were: the arithmetic logic unit (ALU), the register file, the program memory, the program counter and the control unit. Components were combine in a hierarchical design to implement the microprocessor and programmed with simple machine code. All were thoroughly tested at each combination step.

<img width="450" alt="Screenshot 2023-03-30 at 13 54 59" src="https://user-images.githubusercontent.com/103330637/228842503-21280c6b-19c6-46f5-97ca-4d6c9749222d.png">

## Demostration
Simulations using Icarus Verilog:

```
t = 0 clk = 0, t_reset = 1 t_ALUResult = xxxxxxxx t_cpu_out = x
t = 10 clk = 1, t_reset = 1 t_ALUResult = 00000001 t_cpu_out = x
t = 20 clk = 0, t_reset = 0 t_ALUResult = 00000001 t_cpu_out = x
t = 30 clk = 1, t_reset = 0 t_ALUResult = 00100000 t_cpu_out = x
t = 40 clk = 0, t_reset = 0 t_ALUResult = 00100000 t_cpu_out = x
t = 50 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = x
t = 60 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = x
t = 70 clk = 1, t_reset = 0 t_ALUResult = 11100001 t_cpu_out = 0
t = 80 clk = 0, t_reset = 0 t_ALUResult = 11100001 t_cpu_out = 0
t = 90 clk = 1, t_reset = 0 t_ALUResult = 00000010 t_cpu_out = 0
t = 100 clk = 0, t_reset = 0 t_ALUResult = 00000010 t_cpu_out = 0
t = 110 clk = 1, t_reset = 0 t_ALUResult = 00000001 t_cpu_out = 0
t = 120 clk = 0, t_reset = 0 t_ALUResult = 00000001 t_cpu_out = 0
t = 130 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 1
t = 140 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 1
t = 150 clk = 1, t_reset = 0 t_ALUResult = 11100010 t_cpu_out = 1
t = 160 clk = 0, t_reset = 0 t_ALUResult = 11100010 t_cpu_out = 1
t = 170 clk = 1, t_reset = 0 t_ALUResult = 00000100 t_cpu_out = 1
t = 180 clk = 0, t_reset = 0 t_ALUResult = 00000100 t_cpu_out = 1
t = 190 clk = 1, t_reset = 0 t_ALUResult = 00000010 t_cpu_out = 1
t = 200 clk = 0, t_reset = 0 t_ALUResult = 00000010 t_cpu_out = 1
t = 210 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 2
t = 220 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 2
t = 230 clk = 1, t_reset = 0 t_ALUResult = 11100100 t_cpu_out = 2
t = 240 clk = 0, t_reset = 0 t_ALUResult = 11100100 t_cpu_out = 2
t = 250 clk = 1, t_reset = 0 t_ALUResult = 00001000 t_cpu_out = 2
t = 260 clk = 0, t_reset = 0 t_ALUResult = 00001000 t_cpu_out = 2
t = 270 clk = 1, t_reset = 0 t_ALUResult = 00000011 t_cpu_out = 2
t = 280 clk = 0, t_reset = 0 t_ALUResult = 00000011 t_cpu_out = 2
t = 290 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 3
t = 300 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 3
t = 310 clk = 1, t_reset = 0 t_ALUResult = 11101000 t_cpu_out = 3
t = 320 clk = 0, t_reset = 0 t_ALUResult = 11101000 t_cpu_out = 3
t = 330 clk = 1, t_reset = 0 t_ALUResult = 00010000 t_cpu_out = 3
t = 340 clk = 0, t_reset = 0 t_ALUResult = 00010000 t_cpu_out = 3
t = 350 clk = 1, t_reset = 0 t_ALUResult = 00000100 t_cpu_out = 3
t = 360 clk = 0, t_reset = 0 t_ALUResult = 00000100 t_cpu_out = 3
t = 370 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 4
t = 380 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 4
t = 390 clk = 1, t_reset = 0 t_ALUResult = 11110000 t_cpu_out = 4
t = 400 clk = 0, t_reset = 0 t_ALUResult = 11110000 t_cpu_out = 4
t = 410 clk = 1, t_reset = 0 t_ALUResult = 00100000 t_cpu_out = 4
t = 420 clk = 0, t_reset = 0 t_ALUResult = 00100000 t_cpu_out = 4
t = 430 clk = 1, t_reset = 0 t_ALUResult = 00000101 t_cpu_out = 4
t = 440 clk = 0, t_reset = 0 t_ALUResult = 00000101 t_cpu_out = 4
t = 450 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 460 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 470 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 480 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 490 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 500 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 510 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 520 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 530 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 540 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 550 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 560 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 570 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 580 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 590 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 600 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 610 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 620 clk = 0, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
t = 630 clk = 1, t_reset = 0 t_ALUResult = 00000000 t_cpu_out = 5
```
Simulation using GTKWave:

<img width="992" alt="cpu" src="https://user-images.githubusercontent.com/103330637/228845861-66e8e943-9e9d-432d-bea0-b8aaf655150a.png">
