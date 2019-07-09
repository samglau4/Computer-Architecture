`timescale 1ns / 1ps

module D_reg #(parameter WIDTH = 8) (input clk, reset, EN, input [WIDTH-1:0] D, output reg [WIDTH-1:0] Q);
    always@(posedge clk, posedge reset)
        if(reset) Q <= 0;
        else if(EN) Q <= D;
        else Q <= Q;
endmodule