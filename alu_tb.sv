`timescale 1ns/1ps 
`include "alu.sv"

module alu_tb;
logic [7:0] t_SrcA, t_SrcB;
logic [1:0] t_ALUControl;
logic [7:0] t_ALUResult;
logic t_Zero;

alu uut (t_SrcA, t_SrcB, t_ALUControl, t_ALUResult, t_Zero);

initial begin
// Stimulus generator
t_SrcA = 8'h05; t_SrcB = 8'h0A;
t_ALUControl = 2'b00; #10;
t_ALUControl = 2'b01; #10;
t_ALUControl = 2'b10; #10;
t_ALUControl = 2'b11; #10;
end

initial begin // Response monitor
$monitor ("t_ALUControl = %b t_SrcA = %h t_SrcB = %h t_ALUResult = %h t_Zero = %d",
        t_ALUControl, t_SrcA, t_SrcB, t_ALUResult, t_Zero);
end
endmodule