`include "reg_file.sv", "alu.sv"

module reg_file_alu(input logic [3:0] RA1, RA2, WA,
                    input logic [7:0] immediate,
                    input logic [1:0] ALUControl,
                    input logic write_enable, ALUSrc, CLK,
                    output logic [7:0] ALUResult, cpu_out,
                    output logic Zero);
logic A, B, B0, C;

reg_file(RA1, RA2, WA, C, CLK, write_enable, A, B0, cpu_out);
alu(A, B, ALUControl, ALUResult, Zero);
// 2 to 1 multiplexer
assign B = (ALUSrc) ? immediate : RD2;

endmodule
