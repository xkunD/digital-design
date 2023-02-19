`include "instruction_memory.sv"
`include "pc.sv"

module instruction_memory_pc_test (input logic[7:0] immediate,
                            input logic PCSrc, CLK, reset,
                            output logic [23:0] Instr,
                            output logic [7:0] x_pc);
logic [7:0] x_PC;
pc new_pc (immediate, PCSrc, CLK, reset, x_PC);
instruction_memory new_im(x_PC, Instr);
assign x_pc = x_PC;
endmodule