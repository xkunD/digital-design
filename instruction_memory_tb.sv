`timescale 1ns/1ps 
`include "alu.sv"

module instruction_memory_tb;
logic [7:0] t_PC;
logic [23:0] t_Instr;

instruction_memory dut (t_PC, t_Instr);

initial begin
    $dumpfile("instruction_memory_tb.vcd"); 
    $dumpvars(0, instruction_memory_tb);
    // Stimulus generator
    
end

initial begin // Response monitor
    $monitor ("t_PC = %h t_Instr = %h", t_PC, t_Instr);
end

endmodule