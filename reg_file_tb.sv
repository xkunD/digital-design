`timescale 1ns/1ps
`include "reg_file.sv"

module reg_file_tb;



logic [3:0] t_RA1, t_RA2, t_WA;
logic [7:0] ALUResult;
logic t_clk, t_write_enable;
logic [7:0] t_RD1, t_RD2, t_cpu_out;

reg_file R1 (t_RA1, t_RA2, t_WA, ALUResult, t_clk,  t_write_enable, t_RD1, t_RD2, t_cpu_out);

initial begin
  t_RA1 = 4'b0001;
  t_RA2 = 4'b0010;
  t_WA = 4'b1010;
  ALUResult = 8'b00000011;
  t_clk = 1'b1;
  //t_reset = 1'b0;
  t_write_enable = 1'b1;
  #10
  t_RA1 = 4'b0100;
  t_RA2 = 4'b1000;
  t_WA = 4'b1100;
  ALUResult = 8'b00100100;
  t_clk = 1'b0;
  //t_reset = 1'b1;
  t_write_enable = 1'b0;
  #10
  t_RA1 = 4'b1010;
  t_RA2 = 4'b0001;
  t_WA = 4'b1111;
  ALUResult = 8'b11110001;
  //t_reset = 1'b0;
  t_clk = 1'b1;
  t_write_enable = 1'b1;
end

initial begin
  $monitor ("t_RA1 = %d t_RA2 = %d t_WA = %d ALUResult = %d t_clk = %d t_write_enable = %d t_RD1 = %d t_RD2 = %d",
            t_RA1, t_RA2, t_WA, ALUResult, t_clk,  t_write_enable, t_RD1, t_RD2);
end

endmodule