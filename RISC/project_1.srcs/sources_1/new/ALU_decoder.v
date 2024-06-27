`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 17:07:05
// Design Name: 
// Module Name: ALU_decoder
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


module ALU_decoder(
input [1:0]ALU_op,
input [2:0]func3,
input [6:0]op,
input [6:0]funct7,
output [2:0]ALU_control
);
assign ALU_control=(ALU_op==2'b00)?(3'b000):
                   (ALU_op==2'b01)?(3'b001):
                   (ALU_op==2'b10 && func3==3'b000 && {op[5],funct7[5]}!=3'b11)?(3'b000):
                   (ALU_op==2'b10 && func3==3'b000 && {op[5],funct7[5]}==3'b11)?(3'b001):
                   (ALU_op==2'b10 && func3==3'b010)?(3'b101):
                   (ALU_op==2'b10 && func3==3'b110)?(3'b011):
                   (ALU_op==2'b10 && func3==3'b111)?(3'b010):(3'b000);
endmodule
