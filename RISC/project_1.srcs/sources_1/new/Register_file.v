`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 19:01:00
// Design Name: 
// Module Name: Register_file
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


module Register_file(
    input [4:0]A1,
    input [4:0]A2,
    input [4:0]A3,
    output [31:0]RD1,
    output [31:0]RD2,
    input clk,
    input WE3,
    input [31:0]WD3,
    input rst
    );
reg [31:0]Registers[11:0];
assign RD1=(~rst)?(32'h00000000):(Registers[A1]);
assign RD2=(~rst)?(32'h00000000):Registers[A2];
always @(negedge clk) begin
if(WE3)begin
Registers[A3]<=WD3;
end
end
initial begin
Registers[5] = 32'h00000006;
Registers[6] = 32'h0000000A;
Registers[9] = 32'h00000020;      
end
endmodule
