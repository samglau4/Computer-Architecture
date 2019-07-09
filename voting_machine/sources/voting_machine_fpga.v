`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2018 12:04:28 PM
// Design Name: 
// Module Name: voting_machine_fpga
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


module voting_machine_fpga
(input clk100MHz, rst, A, B, C, output [7:0] LEDSEL, LEDOUT);
supply1 [7:0] vcc;
wire DONT_USE, clk_5KHz;
wire [3:0] i;
wire [7:0] vote;
voting_rule VTR (A, B, C, i[3], i[2], i[1], i[0]);
clk_gen CLK (clk100MHz, rst, DONT_USE, clk_5KHz);
bcd_to_7seg BCD (i, vote);
led_mux LED (clk_5KHz, rst, vcc, vcc, vcc, vcc, vcc, vcc, vcc, vote,
LEDSEL, LEDOUT);
endmodule