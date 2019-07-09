`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2018 04:38:06 PM
// Design Name: 
// Module Name: encoder_casez
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


module encoder_casez
(input [7:0] A, output reg [2:0] Y, reg Valid);
    always@(A)
    begin
        Valid = 1;
        casex (A)
            8'b 1zzzzzzz: Y=7;
            8'b 01zzzzzz: Y=6;
            8'b 001zzzzz: Y=5;
            8'b 0001zzzz: Y=4;
            8'b 00001zzz: Y=3;
            8'b 000001zz: Y=2;
            8'b 0000001z: Y=1;
            8'b 00000001: Y=0;
            default:
                begin
                    Valid=0;
                    Y = 3'bX;
                end
        endcase
    end

endmodule
