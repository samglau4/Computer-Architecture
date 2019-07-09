`timescale 1ns / 1ps

module regfile2_tb;

    reg         tb_clk,
                tb_we1, tb_we2;                 // write enables
    reg  [4:0]  tb_ra1, tb_ra2, tb_wa1, tb_wa2; // read/write address
    reg  [31:0] tb_wd1, tb_wd2;                 // write data
    wire [31:0] tb_rd1, tb_rd2;                 // read  data

    regfile2 DUT0 ( .clk(tb_clk),
                    .we1(tb_we1), .we2(tb_we2),
                    .ra1(tb_ra1), .ra2(tb_ra2),
                    .wa1(tb_wa1), .wa2(tb_wa2),
                    .wd1(tb_wd1), .wd2(tb_wd2),
                    .rd1(tb_rd1), .rd2(tb_rd2) );

    integer i, j;
    reg [31:0] expected;
    reg [31:0] expected_read[31:0];
    reg [4:0]  expected_addr[31:0];
    integer check_corner = 0; // 1 if checking for CORNER_CASE

    initial begin
        i = 0; j = 0;
        tb_clk = 0; tb_we1 = 0; tb_we2 = 0; #5
        forever
            #5 tb_clk = ~tb_clk;
    end

    always @(tb_ra1) begin
        if (!check_corner) begin
            expected = expected_read[j];
            if (tb_rd1 !== expected_read[j] || tb_ra1 != expected_addr[j]) begin
               $display("FAILED");
//               $finish;
            end
        end
    end

    always @(tb_ra2) begin
            expected = expected_read[j];
            if (tb_rd2 !== expected_read[j] || tb_ra2 != expected_addr[j]) begin
                $display("FAILED");
//                $finish;
            end
    end

    initial begin
        WRITE_DATA1; READ_DATA(0);
        WRITE_DATA2; READ_DATA(1);
        #10
        CORNER_CASE; #10
        $finish;
    end

    // Write to all registers using write port 1
    task WRITE_DATA1;
        begin
            expected_read[0] = 32'b0;
            expected_addr[0] = 0;
            expected_read[1] = 32'bX;
            expected_addr[1] = 1;
            for (i=2; i<32; i=i+1) begin
                @(posedge tb_clk);
                tb_we1 = 1'b1;     // enable writing
                tb_wa1 = i;        // set write address
                tb_wd1 = $random;  // generate random data
                expected_read[i] = tb_wd1;     // save data and address to check when reading
                expected_addr[i] = tb_wa1;
            end
        end
    endtask

    // Write to all registers using write port 2
    task WRITE_DATA2;
        begin
            for (i=2; i<32; i=i+1) begin
                @(posedge tb_clk);
                tb_we2 = 1'b1;     // enable writing
                tb_wa2 = i;        // set write address
                tb_wd2 = $random;  // generate random data
                expected_read[i] = tb_wd2;     // save data and address to check when reading
                expected_addr[i] = tb_wa2;
            end
        end
    endtask

    // read from specified read port
    // read2 = 0 -> read from read port 1
    // read1 = 1 -> read from read port 2
    task READ_DATA(input read2);
        begin
            #5 tb_we1 <= 0; #5 tb_we2 <= 0; // disable writing on both ports
            for (j=0; j<32; j=j+1) begin
                if (read2) begin tb_ra2 = j; #5; end
                else       begin tb_ra1 = j; #5; end
            end
        end
    endtask

    task CORNER_CASE;
        begin
            check_corner = 1;   // enable corner case checking
            j = 30;
            expected_read[j] <= 32'b1;
            tb_we2 <= 1'b1;
            tb_wa2 <= 30; tb_ra1 <= 30; tb_ra2 <= 30;
            tb_wd2 = 32'b1;
            repeat(2) @(posedge tb_clk);
        end
    endtask

endmodule
