`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 15:19:25
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0]A,
    input [31:0]B,
    output [31:0]ALU_out,
    output C,
    output N,
    output Z,
    output V,
    input [2:0]ALU_control
);
wire [31:0]A_and_B;
wire [31:0]A_or_B;
wire [31:0]sum;
wire [31:0]slt;
wire [31:0]B_not;
assign B_not=~B;
assign {C,sum}=(ALU_control==3'b000)?(A+B+ALU_control[0]):(A+B_not+ALU_control[0]);
assign A_and_B=A &B;
assign A_or_B=A | B;
assign slt={31'b0000000000000000000000000000000,sum[31]};
assign ALU_out=(ALU_control==3'b000 || ALU_control==3'b001)?(sum):
              (ALU_control==3'b010)?(A_and_B):
              (ALU_control==3'b011)?(A_or_B):
              (ALU_control==3'b101)?(slt):(32'h00000000);
assign N=ALU_out[31];
assign Z=&(~ALU_out);
assign V=((sum[31] ^ A[31]) & 
                      (~(ALU_control[0] ^ B[31] ^ A[31])) &
                      (~ALU_control[1]));
endmodule
