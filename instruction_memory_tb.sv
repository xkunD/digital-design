`timescale 1ns/1ps 
`include "instruction_memory.sv"

module instruction_memory_tb;
logic [7:0] t_PC;
logic [23:0] t_Instr;

instruction_memory dut (t_PC, t_Instr);

initial begin
    $dumpfile("instruction_memory_tb.vcd"); 
    $dumpvars(0, instruction_memory_tb);
    // Stimulus generator
    t_PC = 8'h00; 
    #10 t_PC = 8'h01;
    #10 t_PC = 8'h02;
    #10 t_PC = 8'h03;
    #10 t_PC = 8'h04;
    #10 t_PC = 8'h05;
    #10 t_PC = 8'h06;
    #10 t_PC = 8'h07;
    $finish;
end

initial begin // Response monitor
    $monitor ("t_PC = %h t_Instr = %h", t_PC, t_Instr);
end

endmodule