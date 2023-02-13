module alu(input logic [7:0] SrcA,
            input logic [7:0] SrcB,
            input logic [1:0] ALUControl,
            output logic [7:0] ALUResult,
            output logic Zero);

always_comb
case (ALUControl)
2'b00 : ALUResult = SrcA & SrcB;
2'b01 : ALUResult = SrcA | SrcB;
2'b10 : ALUResult = SrcA + SrcB;
2'b11 : ALUResult = SrcA - SrcB;
default : ALUResult = 8'bx;
endcase

assign Zero = (ALUResult == 8'b0);

endmodule