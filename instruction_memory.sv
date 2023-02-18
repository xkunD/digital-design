module instruction_memory(input logic[7:0] PC,
                        output logic[23:0] Instr);
logic [23:0] data_ROM [0:256];
initial
$readmemh(“rom.txt”, data_rom); 
assign Instr = instruction_memory[PC]; 
endmodule
