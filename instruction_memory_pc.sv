`include "instruction_memory.sv"
`include "pc.sv"

module instruction_memory_pc (input logic[7:0] immediate,
                            input logic PCSrc, CLK, reset,
                            output logic [23:0] Instr);
logic[7:0] x_PC;             

pc new_pc (immediate, PCSrc, CLK, reset, x_PC);
instruction_memory new_im(x_PC, Instr);
endmodule