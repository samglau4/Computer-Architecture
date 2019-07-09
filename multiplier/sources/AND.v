`timescale 1ns / 1ps

module AND(input [3:0] A, input b, output [3:0] Y);
    assign Y = { A[3] & b, A[2] & b, A[1] & b, A[0] & b };
    
endmodule
