`timescale 1ns/1ps
`include "reg_file.sv"
module reg_file_tb_1;

    // Inputs
    logic [3:0] RA1, RA2, WA;
    logic [7:0] ALUResult;
    logic clk, write_enable;
    // Outputs
    logic [7:0] RD1, RD2, cpu_out;

    reg_file reg_file_inst(.RA1(RA1), .RA2(RA2), .WA(WA), .ALUResult(ALUResult),
                           .clk(clk), .write_enable(write_enable),
                           .RD1(RD1), .RD2(RD2), .cpu_out(cpu_out));

    // Test cases
    initial begin
        // Test case 1
        RA1 = 1; RA2 = 2; WA = 3; ALUResult = 8'h12; write_enable = 1;
        #10;
        RA1 = 4; RA2 = 5; WA = 6; ALUResult = 8'h34; write_enable = 0;
        #10;
        RA1 = 7; RA2 = 8; WA = 9; ALUResult = 8'h56; write_enable = 1;
        #10;
        clk = 1; WA = 8; RA2 = 8; 
        #10;
        clk = 1; WA = 7; RA1 = 7;
        #10
        clk = 0;
        #10
        clk = 1;
        $finish;
    end
    initial begin
  $monitor ("t_RA1 = %d t_RA2 = %d t_WA = %d ALUResult = %d t_clk = %d t_write_enable = %d t_RD1 = %d t_RD2 = %d",
            RA1, RA2, WA, ALUResult, clk,  write_enable, RD1, RD2);
end
endmodule

