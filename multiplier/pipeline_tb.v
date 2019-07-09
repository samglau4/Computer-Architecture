`timescale 1ns / 1ps

module pipeline_tb;
    reg [3:0] A_tb, B_tb;
    reg clk_tb, reset_tb, EN_tb;
    wire [7:0] Y_tb;
    
    pipeline_multiplier DUT0 (.A(A_tb), .B(B_tb), .clk(clk_tb), .reset(reset_tb), .EN(EN_tb), .Y(Y_tb));
    
    reg [4:0] A_reg[2:0], B_reg[2:0]; /*To reference the inputs to registers*/
    reg [7:0] expected;
    
    initial begin
        clk_tb = 0; reset_tb = 0; EN_tb = 0;
        repeat(2) #5 reset_tb = ~reset_tb; /*refresh register*/
        #5;
        EN_tb = 1;  /*enable registers */
        forever begin
            #5;
            clk_tb = ~clk_tb; /*start clock*/
        end
     end
     
     always@(posedge clk_tb)
     begin
        A_reg[2] <= A_reg[1];   B_reg[2] <= B_reg[1];
        A_reg[1] <= A_reg[0];   B_reg[1] <= B_reg[0];
        A_reg[0] <= A_tb;       B_reg[0] <= B_tb;
     end
     
     always@(A_reg[2], B_reg[2])
     begin
        expected = A_reg[2] * B_reg[2]; #5;
        if(expected != Y_tb) begin
            $display("Test Failed");
        end
     end
     
     initial begin
        for (integer a=0; a<16; a=a+1) begin
            for (integer b=0; b<16; b=b+1) begin
                A_tb = a; B_tb = b; #5; 
//                @(posedge clk_tb);
            end
        end
        repeat(3) @(posedge clk_tb);
        $finish;
    end               
endmodule
