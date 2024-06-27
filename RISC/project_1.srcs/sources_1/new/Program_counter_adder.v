`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2024 14:04:53
// Design Name: 
// Module Name: Program_counter_adder
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


module Program_counter_adder(
    input[31:0]A,
    output [31:0]C
);
wire [31:0]B;
assign B=32'h00000004;
assign C=A+B;
endmodule
