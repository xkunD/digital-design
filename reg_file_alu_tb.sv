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
  t_RA1 = 1; t_RA2 = 2; t_WA = 0; t_immediate = 5; t_write_enable = 0; t_ALUSrc = 1; t_ALUControl = 2'b11;
  #15 t_write_enable = 1; 
  #20 t_WA = 1; t_ALUSrc = 0;
  #20 t_WA = 5; t_ALUSrc = 1;
  #20 t_write_enable = 0;
  #10 t_RA2 = 5;
  #10;
  #10 t_WA = 15; t_write_enable = 1;
  #10 t_immediate = 15;
  #30;
$finish; // This system tasks ends the simulation 
end

initial begin // Response monitor
  $monitor ("t = %3d, RA1 = %d RA2 = %d WA = %d Immediate = %d clk = %d write_enable = %d alusRC = %d alucontrol = %d aluresult = %d cpu_out = %d zero = %d",
            $time, t_RA1, t_RA2, t_WA, t_immediate, clk,  t_write_enable, t_ALUSrc, t_ALUControl, t_ALUResult, t_cpu_out, t_Zero);
end
endmodule


