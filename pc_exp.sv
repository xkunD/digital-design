module pc_exp(input logic clk, reset,
output logic [7:0] count); 
always_ff @ (posedge clk) begin
if (reset) count <= 8'b0; else count <= count + 1; 
end
endmodule