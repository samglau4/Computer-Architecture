`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2018 04:48:46 PM
// Design Name: 
// Module Name: inferred_tb
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


module inferred_tb;

reg [3:0] A_tb;
reg [3:0] B_tb;
reg       cin_tb;

wire [3:0] Y_inferred;
wire       cout_inferred;

inferred_adder DUT0(.A(A_tb), .B(B_tb), .cin(cin_tb), .Y(Y_inferred), .cout(cout_inferred));

reg [4:0] expected_inferred;
reg [4:0] expected;

initial begin
    for(integer a = 0; a < 16; a = a + 1) begin
        for(integer b = 0; b < 16; b = b + 1) begin
            for(integer i = 0; i < 2; i = i + 1) begin
                A_tb = a;
                B_tb = b;
                cin_tb = i;
                #10;
                
                expected = a + b + i;
                
                expected_inferred = {cout_inferred, Y_inferred};
                
                if(expected != expected_inferred) begin
                    $display("Inferred FAILED");
                    $finish;
                end
             end
          end
       end
    end
endmodule
