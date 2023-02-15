`timescale 1ns/1ps
`include "reg_file_example.sv"

module reg_file_example_tb;


logic [7:0] t_data_in;
logic [3:0] t_RA1, t_RA2, t_WA;
logic t_clk, t_reset, t_write_enable;
logic [7:0] t_data_out1, t_data_out2;

reg_file_example R1 (t_RA1, t_RA2, t_WA, t_data_in, t_clk, t_reset, t_write_enable, t_data_out1, t_data_out2);

initial begin
  t_RA1 = 4'b0001;
  t_RA2 = 4'b0010;
  t_WA = 4'b1010;
  t_data_in = 8'b00000011;
  t_reset = 1'b0;
  t_write_enable = 1'b1;
  #10
  t_RA1 = 4'b0100;
  t_RA2 = 4'b1000;
  t_WA = 4'b1100;
  t_data_in = 8'b00100100;
  t_reset = 1'b1;
  t_write_enable = 1'b0;
  #10
  t_RA1 = 4'b1010;
  t_RA2 = 4'b0001;
  t_WA = 4'b1111;
  t_data_in = 8'b11110001;
  t_reset = 1'b0;
  t_write_enable = 1'b1;
end

initial begin
  $monitor ("t_RA1 = %d t_RA2 = %d t_WA = %d t_data_in = %d t_clk = %d t_reset = %d t_write_enable = %d t_data_out1 = %d t_data_out2 = %d",
            t_RA1, t_RA2, t_WA, t_data_in, t_clk, t_reset, t_write_enable, t_data_out1, t_data_out2);
end

endmodule