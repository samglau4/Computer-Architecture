`timescale 1ns / 1ps

module regfile2(
    input clk, we1, we2,
    input [4:0] ra1, ra2, wa1, wa2,
    input [31:0] wd1, wd2,
    output [31:0] rd1, rd2
    );
    
    reg [31:0] regfile[31:0];
    
    initial
        regfile[0] = 32'b0;
        
    always@(posedge clk) begin
            if(we1) regfile[wa1] <= wd1;
            if(we2) regfile[wa2] <= wd2;
    end
    
    assign rd1 = ra1 ? regfile[ra1] : 0;
    assign rd2 = ra2 ? regfile[ra2] : 0;
        
endmodule
