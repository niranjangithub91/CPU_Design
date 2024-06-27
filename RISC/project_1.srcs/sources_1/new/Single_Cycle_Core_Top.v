`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2024 16:23:04
// Design Name: 
// Module Name: Single_Cycle_Core_Top
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


module Single_Cycle_Core_Top(
input clk,
input rst,
output wire [31:0]PC_top,
output wire [31:0]RD_instuction,
output wire [31:0]RD1_reg,
output wire [31:0]RD2_reg,
output wire [31:0]Read_data,
output wire [31:0]ALU_out,
output wire [31:0]Imm_extend_top,
output wire [2:0]ALU_Control_Top,
output wire ALUsrc,
output wire [6:0]op,
output wire [2:0]func33
    );
assign op=RD_instuction[6:0];
assign func33=RD_instuction[14:12];
wire [31:0]PC_next;
wire Reg_write;
wire [1:0]Immsrc;
wire Mem_write;
wire [31:0]ALU_mux_out;
wire [31:0]data_mem_mux_out;
wire result_src;
Program_Counter aut(.clk(clk),.rst(rst),.PC_next(PC_next),.P(PC_top));

Instruction_memory but(.P(PC_top),.rst(rst),.Rd(RD_instuction));

Register_file cut(.A1(RD_instuction[19:15]),.A2(RD_instuction[24:20]),.A3(RD_instuction[11:7]),.RD1(RD1_reg),.RD2(RD2_reg),.clk(clk),.WE3(Reg_write),.WD3(data_mem_mux_out),.rst(rst));

sign_extend dut(.A(RD_instuction),.B(Imm_extend_top),.Immsrc(Immsrc[0]));

ALU eut(.A(RD1_reg),.B(ALU_mux_out),.ALU_out(ALU_out),.C(),.V(),.N(),.Z(),.ALU_control(ALU_Control_Top));

Main_control_unit fut(.opcode(RD_instuction[6:0]),.zero(),.funct7(RD_instuction[31:25]),.func3(RD_instuction[14:12]),.PC_src(),.Result_src(result_src),.Mem_write(Mem_write),.ALU_src(ALUsrc),.Reg_Write(Reg_write),.Imm_src(Immsrc),.ALU_control(ALU_Control_Top));

Data_Memory gut(.clk(clk),.WE(Mem_write),.A(ALU_out),.Rd(Read_data),.Wd(RD2_reg));

Program_counter_adder hut(.A(PC_top),.C(PC_next));

mux1 jut(.A(RD2_reg),.B(Imm_extend_top),.C(ALU_mux_out),.s(ALUsrc));

mux1 kut(.A(ALU_out),.B(Read_data),.C(data_mem_mux_out),.s(result_src));
endmodule
