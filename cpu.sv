`include "control_unit.sv"
`include "reg_file_alu.sv"
`include "instruction_memory_pc.sv"

module cpu (input logic CLK, reset,
            output logic[7:0] ALUResult, cpu_out);
logic x_PCSrc;
logic [23:0] x_Instr;
logic[1:0] x_ALUControl;
logic x_ALUSrc, x_RegWrite, x_Branch, x_Zero;
logic [7:0] x_ALUResult;

instruction_memory_pc cpu_instruction_memory_pc(x_Instr[7:0], x_PCSrc, CLK, reset, 
    x_Instr);

reg_file_alu cpu_reg_file_alu (x_Instr[15:12], x_Instr[11:8], x_Instr[19:16], x_Instr[7:0], x_ALUControl, x_RegWrite, x_ALUSrc, CLK, 
    x_ALUResult, cpu_out, x_Zero);

control_unit cpu_control_unit (x_Instr[23:20], x_Branch, x_ALUSrc, x_RegWrite, x_ALUControl);

assign x_PCSrc = x_Branch & x_Zero;

endmodule