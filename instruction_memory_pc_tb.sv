`timescale 1ps/1ps
`include "instruction_memory_pc.sv"

module instruction_memory_pc_tb;
logic [7:0] t_immediate;
logic t_PCSrc, clk, t_reset;
logic [23:0] t_Instr;


instruction_memory_pc dut(t_immediate, t_PCSrc, clk, t_reset, t_Instr);

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
    $monitor ("t = %3d clk = %d, t_immediate = %b t_PCSrc = %b t_reset = %d t_Instr = %h", $time, clk, t_immediate, t_PCSrc, t_reset, t_Instr);
    #120;
    $finish; 
end

endmodule