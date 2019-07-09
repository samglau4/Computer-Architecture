`timescale 1ns / 1ps

module CLA_8bit(input [7:0] A, B, input cin,
                output [7:0] Y, output cout);
               
    wire DONT_USE;            
    
    CLA_4bit u0 (A[3:0], B[3:0], cin, Y[3:0], DONT_USE);
    CLA_4bit u1 (A[7:4], B[7:4], DONT_USE, Y[7:4], cout);    
    
endmodule
