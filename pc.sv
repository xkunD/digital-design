module pc (input logic[7:0] immediate, 
            input logic PCSrc, CLK, reset,
            output logic[7:0] PC);
always_ff @ (posedge CLK) begin
    if (reset) count <= 8'b0; 
    else if (PCSrc) count <= immediate;
    else count <= count + 1; 
end
endmodule