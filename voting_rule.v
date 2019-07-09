`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2018 12:07:10 PM
// Design Name: 
// Module Name: voting_rule
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


module voting_rule
(input w, n, o, output a, b, c, d);
assign a = w&n&o;
assign b = ~w&~n&o | ~w&n&o | w&~n&o | w&n&~o;
assign c = ~w&n&~o | ~w&n&o | w&~n&o | w&~n&~o;
assign d = ~w&n&~o | ~w&n&o | w&n&~o | w&n&o;
endmodule
