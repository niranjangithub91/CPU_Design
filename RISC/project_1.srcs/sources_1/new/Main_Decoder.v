`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 16:49:55
// Design Name: 
// Module Name: Main_Decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Main_Decoder(
    input [6:0]op,
    input zero,
    output PC_src,
    output Result_src,
    output Mem_write,
    output ALU_src,
    output Reg_Write,
    output [1:0]Imm_src,
    output [1:0]ALU_op
);
wire Branch;
assign PC_src=zero & Branch;
assign Reg_Write=(op==7'b0000011 || op==7'b0110011)?(1'b1):(1'b0);
assign Imm_src=(op==7'b0000011 || op==7'b0110011)?(2'b00):
               (op==7'b0100011)?(2'b01):(2'b10);
assign ALU_src=(op==7'b0000011 || op==7'b0100011)?(1'b1):(1'b0);
assign Mem_write=(op==7'b0100011)?(1'b1):(1'b0);
assign Result_src=(op==7'b0000011)?(1'b1):(1'b0);
assign Branch=(op==7'b1100011)?(1'b1):(1'b0);
assign ALU_op=(op==7'b0110011)?(2'b10):
               (op==7'b1100011)?(2'b01):(2'b00);
endmodule
