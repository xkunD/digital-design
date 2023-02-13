`timescale 1ns/1ps
`include "reg_file.sv"
module reg_file_tb;

logic [7:0] t_data_out1, t_data_out2, t_data_in;
logic [3:0] t_RA1, t_RA2, t_WA;
logic t_clk, t_reset, t_write_enable;

reg_file DUT (t_data_out1, t_data_out2, t_RA1, t_RA2, t_WA, t_data_in, t_clk, t_reset, t_write_enable);

initial begin
// Stimulus generator
t_RA1 = 4;
t_RA2 = 6;
t_WA = 10;
t_data_in = 32;
t_write_enable = 1;
t_clk = 0;
#5 t_clk = 1;
#5 t_clk = 0;
t_write_enable = 0;
#5 t_clk = 1;
#5 t_clk = 0;
t_RA1 = 3;
t_RA2 = 5;
end

initial begin
// Response monitor
$monitor("t_RA1 = %d, t_RA2 = %d, t_data_out1 = %d, t_data_out2 = %d, t_clk = %d",
t_RA1, t_RA2, t_data_out1, t_data_out2, t_clk);
end

endmodule`


