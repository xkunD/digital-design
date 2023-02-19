`timescale 1ps/1ps
`include "control_unit.sv"

module control_unit_tb;
logic[3:0] t_opcode;
logic t_Branch, t_ALUSrc, t_RegWrite;
logic [1:0] t_ALUControl;

control_unit dut (t_opcode, t_Branch, t_ALUSrc, t_RegWrite, t_ALUControl);

initial begin
    $dumpfile("control_unit_tb.vcd"); 
    $dumpvars(0, control_unit_tb);
    // Stimulus generator
    t_opcode = 4'b0000;
    #20 t_opcode = 4'b0001;
    #20 t_opcode = 4'b0010;
    #20 t_opcode = 4'b0011;
    #20 t_opcode = 4'b0100;
    #20 t_opcode = 4'b0101;
    #20 t_opcode = 4'b0110;
    #20 t_opcode = 4'b0111;
end

initial begin // Response monitor
    $monitor ("t = %3d t_opcode = %b, t_RegWrite = %d, t_ALUSrc = %d, ALUControl = %b, Branch = %d", $time, t_opcode, t_RegWrite, t_ALUSrc, t_ALUControl, t_Branch);
end
endmodule