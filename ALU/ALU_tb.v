`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2018 05:48:28 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb;
reg m_tb, s1_tb, s0_tb;
reg [3:0] A_tb, B_tb;
wire [3:0] out_tb;

ALU DUT(.m(m_tb), .s1(s1_tb), .s0(s0_tb), .A(A_tb), .B(B_tb), .out(out_tb));

initial
    begin
        m_tb = 0;
        s1_tb = 0;
        s0_tb = 0;
        A_tb = 4'b0000;
        B_tb = 4'b0000;
        #60     A_tb = 4'b1010;
                B_tb = 4'b0111;
        #50     s0_tb = 1;
        #50     s1_tb = 1;
        #50     s0_tb = 0;
        
        #50     m_tb = 1;
        #50     s0_tb = 1;
        #50     s1_tb = 0;
        #50     s0_tb = 0;
        
        #50     $stop;
        #20     $finish;
     end
endmodule
