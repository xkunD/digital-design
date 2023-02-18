`timescale 1ps/1ps 
`include "reg_file_alu.sv"

module reg_file_alu_tb;
logic [3:0] t_RA1, t_RA2, t_WA;
logic [7:0] t_immediate, t_ALUResult, t_cpu_out;
logic [1:0] t_ALUControl;
logic t_write_enable, t_ALUSrc, clk, t_Zero;

reg_file_alu dut (t_RA1, t_RA2, t_WA, t_immediate, t_ALUControl, t_write_enable, t_ALUSrc, clk, 
                t_ALUResult, t_cpu_out, t_Zero);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin // Apply stimulus 
  $dumpfile("reg_file_alu_tb.vcd");
  $dumpvars(0, reg_file_alu_tb);
    t_RA1 = 4'h0; t_RA2 = 4'h2; t_WA = 4'h0; t_immediate = 8'h0A; 
    t_ALUSrc = 1; t_ALUControl = 2'b10; t_write_enable = 1;
    #10 t_RA2 = 4'h1; t_WA = 4'h1;
    #10 t_immediate = 8'h07;
    #20 t_RA1 = 4'h1; t_WA = 4'h1;
    #40 t_ALUControl = 2'b11; t_WA = 4'hF;
    #20 t_immediate = 8'b10111111;
    #20 t_immediate = 8'h0; t_ALUControl = 2'b00;
    #10

$finish; // This system tasks ends the simulation 
end

initial begin // Response monitor
  $monitor ("t = %3d, RA1 = %d RA2 = %d WA = %d Immediate = %d clk = %d write_enable = %d alusRC = %d alucontrol = %d aluresult = %d cpu_out = %d zero = %d",
            $time, t_RA1, t_RA2, t_WA, t_immediate, clk,  t_write_enable, t_ALUSrc, t_ALUControl, t_ALUResult, t_cpu_out, t_Zero);
end
endmodule


