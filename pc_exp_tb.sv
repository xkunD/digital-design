`timescale 1ns/1ps
`include "pc_exp.sv"

module pc_exp_tb;
logic [7:0] t_PC;
logic clk;
logic t_reset;

pc_exp pc(clk, t_reset, t_PC);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("pc_exp_tb.vcd"); 
    $dumpvars(0, pc_exp_tb);
    // Stimulus generator
    #10 t_reset = 1; 
    #20 
    #20 t_reset = 0;
    #50 t_reset = 1;
end

initial begin // Response monitor
    $monitor ("t = %3d clk = %d, reset = %b count = %d", $time, clk, t_reset, t_PC);
    #120;
    $finish; 
end

endmodule