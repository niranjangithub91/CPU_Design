`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 18:47:47
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
    input [31:0]PC_next,
    input clk,
    input rst,
    output reg [31:0]P
);
always @(negedge clk or negedge rst)begin
if(rst==1'b0)begin
P<=32'h00000000;
end
else begin
P<=PC_next;
end
end
endmodule
