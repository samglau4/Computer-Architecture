`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2018 04:32:08 PM
// Design Name: 
// Module Name: encoder_if
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


module encoder_if
(input [7:0] A, output reg [2:0] Y, reg Valid);
    always@(A)
    begin
        Valid = 1;
        if (A[7]) Y = 7;
        else if (A[6]) Y = 6;
        else if (A[5]) Y = 5;
        else if (A[4]) Y = 4;
        else if (A[3]) Y = 3;
        else if (A[2]) Y = 2;
        else if (A[1]) Y = 1;
        else if (A[0]) Y = 0;
        else
            begin
                Valid = 0;
                Y = 3'bx;
            end
    end
endmodule
