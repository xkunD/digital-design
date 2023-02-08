module alu(input logic [7:0] a, 
            input logic [7:0] b,
            output logic [7:0] ALUResult,
            input logic [1:0] ALUControl); 
always_comb
case(ALUControl)
3'b000 : ALUResult = a & b; // bitwise a AND b
3'b001 : ALUResult = a | b; // bitwise a OR b
3'b010 : ALUResult = a + b; // addition a + b
3'b100 : ALUResult = a & ~b; // bitwise a AND (NOT b) 
3'b101 : ALUResult = a | ~b; // bitwise a OR (NOT b) 
3'b110 : ALUResult = a - b; // subtraction a - b
default : ALUResult = 8'bx;
endcase
endmodule