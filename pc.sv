module pc (input logic[7:0] immediate, 
            input logic PCSrc, CLK, reset,
            output logic[7:0] PC);
always_ff @ (posedge CLK) begin
    if (reset) PC <= 8'b0; 
    else if (PCSrc) PC <= immediate;
    else PC <= PC + 1; 
end
endmodule