`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 19:27:57
// Design Name: 
// Module Name: Data_Memory
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


module Data_Memory(
    input clk,
    input WE,
    input [31:0]A,
    output [31:0]Rd,
    input [31:0]Wd
    );
reg [31:0]Mem[1023:0];
assign Rd=Mem[A];
initial begin
Mem[28]=32'h00000020;
end
always @(negedge clk)begin
if(WE==1)begin
Mem[A]<=Wd;
end
end
endmodule
