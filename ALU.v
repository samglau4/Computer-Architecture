`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2018 03:53:54 PM
// Design Name: 
// Module Name: ALU
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


module ALU(m, s1, s0, A, B, out, zero, failure);
input m, s1, s0;
input[3:0] A, B;
output reg[3:0] out;
output reg zero, overflow;
always @ (m, s1, s0, A, B)
begin
    overflow = 0;
    if(m == 1'b0)
        case({s1,s0})
            2'b00:  out = ~A;
            2'b01:  out = A&B;
            2'b10:  out = A^B;
            2'b11:  out = A|B;
         endcase
    else if(m == 1'b1)
        case({s1,s0})
            2'b00:  
                begin 
                    out = A - 1; 
                    if(out > A) 
                        overflow = 1; 
                    end 
                end;
            2'b01:  out = A + B;
            2'b10:  out = A - B;
            2'b11:  out = A + 1;
        endcase
    else
        failure = 1;
    end
    
endmodule

//module ALU_inst(inst_m, inst_s1, inst_s0, inst_A, inst_B, inst_out);
//input inst_m, inst_s1, inst_s0;
//input [3:0] inst_A, inst_B;
//output [3:0] inst_out;
//ALU U1(.m(inst_m), .s1(inst_s1), .s0(inst_s0), .A(inst_A), .B(inst_B), .out(inst_out));
//endmodule
