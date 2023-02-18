`timescale 1ns/1ps
`include "pc.sv"

module pc_tb;
logic [7:0] t_PC, t_immediate;
logic t_PCSrc, clk, t_reset;

pc pc(t_immediate, t_PCSrc, clk, t_reset, t_PC);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("pc_tb.vcd"); 
    $dumpvars(0, pc_tb);
    // Stimulus generator
    t_reset = 1; t_PCSrc = 0; t_immediate = 8'b01;
    #10 t_reset = 0; t_PCSrc = 1;
    #20 t_immediate = 8'b111;
    #20 t_PCSrc = 0;
    #50 t_reset = 1;
end

initial begin // Response monitor
    $monitor ("t = %3d clk = %d, t_immediate = %b t_PCSrc = %b t_reset = %d t_PC = %d", $time, clk, t_immediate, t_PCSrc, t_reset, t_PC);
    #120;
    $finish; 
end

endmodule