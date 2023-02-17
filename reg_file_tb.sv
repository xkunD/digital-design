`timescale 1ps/1ps 
`include "reg_file.sv"

module reg_file_tb;
logic [3:0] RA1, RA2, WA;
logic clk, write_enable;
logic [7:0] ALUResult, RD1, RD2, cpu_out;
reg_file dut (RA1, RA2, WA, ALUResult, clk, write_enable, RD1, RD2, cpu_out);

initial begin // Generate clock signal with 20 ns period
clk = 0;
forever #10 clk = ~clk;
end

initial begin // Apply stimulus 
$dumpfile("reg_file_tb.vcd");
$dumpvars(0, reg_file_tb);
RA1 = 1; RA2 = 2; WA = 0; ALUResult = 5; write_enable = 0; 
#10 WA=0; //RESET = 0;
#15 write_enable = 1;
#20 WA = 1; ALUResult = 7;
#20 WA = 5; ALUResult = 13;
#20 write_enable = 0;
#20 RA2 = 5;
#30;
$finish; // This system tasks ends the simulation 
end

initial begin // Response monitor
  $monitor ("t_RA1 = %d t_RA2 = %d t_WA = %d ALUResult = %d t_clk = %d t_write_enable = %d t_RD1 = %d t_RD2 = %d t_cpu_out = %d",
            RA1, RA2, WA, ALUResult, clk,  write_enable, RD1, RD2, cpu_out);
end
endmodule