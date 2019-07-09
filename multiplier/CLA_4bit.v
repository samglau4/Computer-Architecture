`timescale 1ns / 1ps

module CLA_4bit (input [3:0] A, B, input cin, output [3:0] Y, output cout);
                            
    wire [3:0] p;
    wire [3:0] g;
    wire [3:0] C;
    
    Half_Adders u0 (A, B, p, g);
    CLA_gen     u1 (p, g, cin, C, cout);
    sums        u2 (p, C, Y);
    
endmodule
