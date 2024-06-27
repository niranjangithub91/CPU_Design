`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2024 18:35:06
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
    input [31:0]P,
    input rst,
    output [31:0] Rd
    );
reg [31:0]Memory[1023:0];
initial begin
Memory[0]=32'hFFC4A303;
end
assign Rd=(rst==1'b0)?(32'h00000000):(Memory[P]);
endmodule
