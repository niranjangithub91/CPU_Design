`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2024 03:52:19
// Design Name: 
// Module Name: top_tb
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


module top_tb();
reg clk=1'b1,rst;
wire [31:0]PC_top;
wire [31:0]RD_instuction;
wire [31:0]RD1_reg;
wire [31:0]RD2_reg;
wire [31:0]Read_data;
wire [31:0]ALU_out;
wire [31:0]Imm_extend_top;
wire [2:0]ALU_Control_Top;
wire ALUsrc;
wire [6:0]op;
wire [2:0]func33;
wire [1:0]ALU_op;
Single_Cycle_Core_Top uut(.clk(clk),.rst(rst),.PC_top(PC_top),.RD_instuction(RD_instuction),.RD1_reg(RD1_reg),.Read_data(Read_data),.ALU_out(ALU_out),.Imm_extend_top(Imm_extend_top),.ALU_Control_Top(ALU_Control_Top),.RD2_reg(RD2_reg),.ALUsrc(ALUsrc),.op(op),.func33(func33));
Main_control_unit dut(.ALU_op(ALU_op));
always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #100;

        rst <=1'b1;
        #450;
        $finish;
    end
endmodule
