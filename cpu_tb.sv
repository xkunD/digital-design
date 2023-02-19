`timescale 1ps/1ps
`include "cpu.sv"

module cpu_tb;
logic clk, t_reset;
logic [7:0] t_ALUResult, t_cpu_out;

cpu dut (clk, t_reset, t_ALUResult, t_cpu_out);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("cpu_tb.vcd"); 
    $dumpvars(0, cpu_tb);
    // Stimulus generator
    t_reset = 1; 
    #20 t_reset = 0;
    #600 $finish;
end

initial begin // Response monitor
    $monitor ("t = %3d clk = %d, t_reset = %d t_ALUResult = %b t_cpu_out = %d", $time, clk, t_reset, t_ALUResult, t_cpu_out);
end
endmodule