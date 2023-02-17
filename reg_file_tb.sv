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
#15 write_enable = 1;
#20 WA = 1; ALUResult = 7;
#20 WA = 5; ALUResult = 13;
#20 write_enable = 0;
#10 RA2 = 5;
#10;
#10 WA = 15; write_enable = 1;
#10 ALUResult = 15;
#30;
$finish; // This system tasks ends the simulation 
end

initial begin // Response monitor
  $monitor ("t = %3d, RA1 = %d RA2 = %d WA = %d ALUResult = %d clk = %d write_enable = %d RD1 = %d RD2 = %d cpu_out = %d",
            $time, RA1, RA2, WA, ALUResult, clk,  write_enable, RD1, RD2, cpu_out);
end
endmodule