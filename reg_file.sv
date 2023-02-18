module reg_file(input logic [3:0] RA1, RA2, WA, 
                input logic [7:0] ALUResult,
                input logic clk, write_enable,
                output logic [7:0] RD1, RD2, cpu_out); 
logic [7:0] rf [0:15];

assign RD1 = rf[RA1]; 
assign RD2 = rf[RA2]; 
assign cpu_out = rf[15];

initial begin
    rf[4'b0] = 8'b0;
end

always_ff @(posedge clk) 
if (write_enable && WA > 0) 
    rf[WA] <= ALUResult;

endmodule 