`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2024 02:59:49
// Design Name: 
// Module Name: sign_extend
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


module sign_extend(
    input [31:0]A,
    output [31:0]B,
    input Immsrc
    );
wire [31:0]B1;
wire [31:0]B2;
assign B1=(A[31])?({{20{1'b1}},A[31:20]}):({{20{1'b0}},A[31:20]});
assign B2=({{20{A[31]}},A[31:25],A[11:7]});
assign B=(Immsrc==1)?(B2):(B1);
endmodule