`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2018 01:42:20 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;

reg [3:0] A_tb;
reg [3:0] B_tb;
reg       cin_tb;

wire [3:0] Y_CLA;
wire       cout_CLA;

wire [3:0] Y_inferred;
wire       cout_inferred;

inferred_adder DUT0(.A(A_tb), .B(B_tb), .cin(cin_tb), .Y(Y_inferred), .cout(cout_inferred));
CLA            DUT1(.A(A_tb), .B(B_tb), .cin(cin_tb), .Y(Y_CLA), .cout(cout_CLA));

reg [4:0] expected_CLA;
reg [4:0] expected_inferred;

initial begin
    for(integer a = 0; a < 16; a = a + 1) begin
        for(integer b = 0; b < 16; b = b + 1) begin
            for(integer i = 0; i < 2; i = i + 1) begin
                A_tb = a;
                B_tb = b;
                cin_tb = i;
                #10;
                
                expected_CLA = {cout_CLA, Y_CLA};
                expected_inferred = {cout_inferred, Y_inferred};
                
                if(expected_inferred != expected_CLA) begin
                    $display("CLA FAILED");
                    $finish;
                end
             end
          end
       end
    end
endmodule
