module reg_file(
input logic [3:0] RA1, RA2, A3,
input logic [7:0] ALUResult,
input logic clk, write_enable,
output logic [7:0] RD1, RD2,
output logic [7:0] cpu_out7_0);

logic [7:0] rf [0:15];

assign rf[0] = 8'b0;

assign RD1 = rf[RA1];
assign RD2 = rf[RA2];
assign cpu_out7_0 = rf[15];

always_ff @(posedge clk) begin
if (write_enable && (A3 > 0)) begin
rf[A3] <= ALUResult;
end
end

endmodule



Regenerate response
