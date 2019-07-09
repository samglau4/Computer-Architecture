`timescale 1ns / 1ps

module FIFO_tb;

    reg        tb_wnr, tb_clk, tb_en, tb_rst;
    reg  [3:0] tb_in;
    wire [3:0] tb_out;
    wire       tb_empty, tb_full;
    
    FIFO DUT0( .wnr(tb_wnr), .en(tb_en), .clk(tb_clk), .rst(tb_rst), .in(tb_in),
               .out(tb_out), .full(tb_full), .empty(tb_empty) );
    
    integer i, j;
    reg [3:0] expected;
    reg [3:0] expected_buff[7:0];
    reg expected_full = 0;
    reg expected_empty = 1;
    integer failures = 0;
    
    initial begin
        tb_clk = 0; tb_wnr = 0; 
        tb_en  = 0; tb_rst = 0; #5
        expected_empty = 1;
        repeat(2) #5 tb_rst = ~tb_rst;  // toggle reset
        tb_en = 1'b1; #5                // enable FIFO
        forever                         // start clock
            #5 tb_clk = ~tb_clk;
    end
    
    always @(tb_out) begin
        if (expected != tb_out || expected_empty != tb_empty || expected_full != tb_full) begin
            $display("FAILED");
            $display("out - expected: %4b result: %4b", expected, tb_out);
            $display("empty - expected: %d result: %d", expected_empty, tb_empty);
            $display("full - expected: %d result: %d", expected_full, tb_full);
            failures = failures + 1;
        end
    end
    
    initial begin
        WRITE; #5 
        READ;  #5
        
        $display("Simulation finished\ntotal failures: %d", failures);
        $finish;
    end
    
    task WRITE;
        begin
            tb_wnr = 1; #5
            for (i = 0; i < 8; i=i+1) begin
                @(posedge tb_clk);
                tb_in = i;
                expected_buff[i] = i;
                expected_empty = 0;
                expected_full = i==7;
            end
            /*
            @(posedge tb_clk);
            //expected_full = 1;
            if (tb_full != expected_full) begin 
                $display("full - expected: %d result: %d", expected_full, tb_full);
                failures = failures + 1;
            end */
        end
    endtask
    
    task READ;
        begin
            tb_wnr = 0; #5 expected_full = 0; #5
            for (j = 0; j < 8; j=j+1) begin
                expected_empty = (j == 7);
                expected = expected_buff[j];
                @(posedge tb_clk);
            end
            expected = 4'bz;
        end
    endtask
    
endmodule
