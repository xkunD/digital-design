`timescale 1ps/1ps

`include "instruction_memory_pc_test.sv"

module instruction_memory_pc_tb;
logic [7:0] t_immediate;
logic t_PCSrc, clk, t_reset;
logic [23:0] t_Instr;
logic [7:0] t_pc;

instruction_memory_pc_test dut(t_immediate, t_PCSrc, clk, t_reset, t_Instr, t_pc);

initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial begin
    $dumpfile("instruction_memory_pc_tb.vcd"); 
    $dumpvars(0, instruction_memory_pc_tb);
    // Stimulus generator
    t_reset = 1; t_PCSrc = 0; t_immediate = 8'b01;
    #10 t_reset = 0; t_PCSrc = 1;
    #20 t_immediate = 8'b101;
    #20 t_PCSrc = 0; t_reset = 1;
    #20 t_reset = 0;
    #20 t_immediate = 8'b111;
    #20 t_PCSrc = 1;
end

initial begin // Response monitor
    $monitor ("t = %3d clk = %d, t_immediate = %b t_PCSrc = %b t_reset = %d t_Instr = %d t_pc = %h", $time, clk, t_immediate, t_PCSrc, t_reset, t_Instr, t_pc);
    #120;
    $finish; 
end

endmodule