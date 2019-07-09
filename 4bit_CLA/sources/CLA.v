`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2018 01:18:49 PM
// Design Name: 
// Module Name: CLA
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


module CLA(input [3:0] A, B, input cin, output [3:0] Y, output cout);

wire [3:0] p;
wire [3:0] g;
wire [3:0] C;

Half_Adders U0 (A, B, p, g);
CLA_gen     U1 (p, g, cin, C, cout);
sums        U2 (p, C, Y);

endmodule
