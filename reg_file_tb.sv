`timescale 1ns/1ps 
`include "reg_file.sv"

module reg_file_tb;

logic [3:0] t_RA1, t_RA2, t_WA;
logic [7:0] t_ALUResult, t_RD1, t_RD2, t_cpu_out;
logic t_CLK, t_write_enable;

reg_file reg_file_inst (t_RA1, t_RA2, t_WA, t_ALUResult, t_CLK, t_write_enable, t_RD1, t_RD2, t_cpu_out);

initial begin
    // Stimulus generator
    t_RA1 = 1;
    t_RA2 = 2;
    t_ALUResult = 8'b00010101;
    t_WA = 1;
    t_write_enable = 1;
    #10 t_CLK = 1;
    #10 t_CLK = 0;
    #10 t_RA1 = 3;
    #10 t_RA2 = 4;
    #10 t_ALUResult = 8'b10101010;
    #10 t_WA = 2;
    #10 t_write_enable = 0;
    #10 t_CLK = 1;
    #10 t_CLK = 0;
    #10 t_RA1 = 15;
    #10 t_RA2 = 0;
    #10 t_ALUResult = 8'b01010101;
    #10 t_WA = 15;
    #10 t_write_enable = 1;
    #10 t_CLK = 1;
    #10 t_CLK = 0;
end

initial begin
    // Response monitor
    $monitor("t_CLK = %b t_write_enable = %b t_RA1 = %d t_RA2 = %d t_WA = %d t_ALUResult = %b t_RD1 = %b t_RD2 = %b t_cpu_out = %b",
            t_CLK, t_write_enable, t_RA1, t_RA2, t_WA, t_ALUResult, t_RD1, t_RD2, t_cpu_out);
end

endmodule
