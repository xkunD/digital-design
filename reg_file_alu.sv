`include "reg_file.sv"
`include "alu.sv"

module reg_file_alu(input logic [3:0] RA1, RA2, WA,
                    input logic [7:0] immediate,
                    input logic [1:0] ALUControl,
                    input logic write_enable, ALUSrc, CLK,
                    output logic [7:0] ALUResult, cpu_out,
                    output logic Zero);
logic[7:0] x_srcA, x_srcB, x_RD2;

alu newalu(x_srcA, x_srcB, ALUControl, ALUResult, Zero);
reg_file newregfile(RA1, RA2, WA, ALUResult, CLK, write_enable, x_srcA, x_RD2, cpu_out);
// 2 to 1 multiplexer
assign x_srcB = (ALUSrc) ? immediate : x_RD2;

endmodule
