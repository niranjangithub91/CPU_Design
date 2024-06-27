`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2024 03:18:38
// Design Name: 
// Module Name: Main_control_unit
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


module Main_control_unit(
input [6:0]opcode,
input zero,
input [6:0]funct7,
input [2:0]func3,
output PC_src,
output Result_src,
output Mem_write,
output ALU_src,
output Reg_Write,
output [1:0]Imm_src,
output [2:0]ALU_control,
output wire [1:0]ALU_op
);
Main_Decoder decode(.op(opcode),.zero(zero),.PC_src(PC_src),
                    .Result_src(Result_src),.Mem_write(Mem_write),.ALU_src(ALU_src),
                    .Imm_src(Imm_src),.Reg_Write(Reg_Write),.ALU_op(ALU_op));
ALU_decoder alu_decode(.ALU_op(ALU_op),.func3(func3),.op(opcode),
                       .funct7(funct7),.ALU_control(ALU_control));
endmodule
