`timescale 1ns / 1ps

module tb_parallel_multiplier;

    reg  [3:0] tb_A, tb_B;
    wire [7:0] tb_Y;
    
    parallel_multiplier DUT0 ( .A(tb_A), .B(tb_B), .Y(tb_Y) );
    
    reg [7:0] expected;
    integer failures = 0;
    
    initial begin
        for (integer a=0; a<16; a=a+1) begin
            for (integer b=0; b<16; b=b+1) begin
               
                tb_A <= a; tb_B <= b;  expected = a * b; #5
              
                if (expected != tb_Y) begin
                    $display("FAILED");
                    failures = failures + 1;
                end 
            end
        end
        
        $display("Simulation finished\ntotal failures: %d", failures);
        $finish;
    end
endmodule