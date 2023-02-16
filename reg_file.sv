module reg_file(
input logic [3:0] RA1,
input logic [3:0] RA2,
input logic [3:0] WA,
input logic [7:0] ALUResult,
input logic clk,
input logic write_enable,
output logic [7:0] RD1,
output logic [7:0] RD2,
output logic [7:0] cpu_out
);
logic [7:0] rf [0:15];

assign RD1 = rf[RA1];
assign RD2 = rf[RA2];
assign cpu_out = rf[15];
assign rf[0] = 8'b0;

always_ff @(posedge clk) 
if (write_enable) 
rf[WA] <= ALUResult;
endmodule



// notes:
/* The line logic [7:0] rf [0:15]; is a declaration of a two-dimensional array of logic values with 8 bits each.

The first dimension, rf[0:15], is an array with 16 elements, indexed from 0 to 15.

The second dimension, logic [7:0], defines each element of the array as a vector of 8 bits, with the most significant bit as 7 and the least significant bit as 0.

So, the entire declaration creates an array of 16 8-bit values, named rf. This can be used to model a register file in digital logic circuits, where each element of the array represents a single register with 8 bits of data.
*/
