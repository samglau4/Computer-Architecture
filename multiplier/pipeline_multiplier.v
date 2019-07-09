`timescale 1ns / 1ps

module pipeline_multiplier(input [3:0] A, B, input clk, reset, EN, output [7:0] Y);
    wire DONT_USE;
    wire [3:0] Q0, Q1, PP0, PP1, PP2, PP3;
    wire [7:0] Q2, Q3, sum0, sum1, product;
    
    D_reg #(4) U0 (clk, reset, EN, A, Q0);
    D_reg #(4) U1 (clk, reset, EN, B, Q1);
    
    AND     A0(Q0, Q1[0], PP0);
    AND     A1(Q0, Q1[1], PP1);
    AND     A2(Q0, Q1[2], PP2);
    AND     A3(Q0, Q1[3], PP3);
    
    CLA_8bit C0 ({4'b0, PP0},       {3'b0, PP1, 1'b0}, 1'b0, sum0, DONT_USE);
    CLA_8bit C1 ({2'b0, PP2, 2'b0}, {1'b0, PP3, 3'b0}, 1'b0, sum1, DONT_USE);
    
    D_reg #(8) U2(clk, reset, EN, sum0, Q2);
    D_reg #(8) U3(clk, reset, EN, sum1, Q3);
    
    CLA_8bit C2 (Q2, Q3, 1'b0, product, DONT_USE);
    
    D_reg #(8) U4(clk, reset, EN, product, Y);
endmodule
