`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2018 12:12:38 PM
// Design Name: 
// Module Name: voting_rule_tb
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


module voting_rule_tb;
reg w, n, o;
wire a, b, c, d;
voting_rule DUT (w, n, o, a, b, c, d);
initial begin
o = 0;
forever #5 o = ~o;
end
initial begin
n = 0;
forever #10 n = ~n;
end
initial begin
w = 0;
forever #20 w = ~w;
end
initial #40 $stop;
initial $monitor($time, "A=%b, B=%b, C=%b : a=%b, b=%b, c=%b, d=%b", w, n,
o, a, b, c, d);
endmodule
