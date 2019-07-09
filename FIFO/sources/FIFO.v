`timescale 1ns / 1ps

module FIFO #(parameter bus_width = 4, addr_width = 3, fifo_depth = 8)
(input wnr, en, clk, rst, input [bus_width-1:0] in,
 output reg [bus_width-1:0] out, output reg full, empty);
    
    reg [addr_width:0] r_ptr, // points to oldest data
                       w_ptr; // points to first empty location
    reg [bus_width-1:0] mem[fifo_depth-1:0];
    
    always @(posedge clk, posedge rst) begin
        if      (rst)            begin r_ptr = 0; w_ptr = 0; end 
        else if (!en)            begin out = 'bz; end 
        else if (wnr && !full)   begin mem[w_ptr[addr_width-1:0]] = in;  w_ptr = w_ptr + 1; end // read
        else if (!wnr && !empty) begin out = mem[r_ptr[addr_width-1:0]]; r_ptr = r_ptr + 1; end // write
        else                     begin out = 'bz; end
    end
    
    always @(r_ptr, w_ptr) begin
        if      (r_ptr == w_ptr)           begin empty = 1; full = 0; end 
        else if (r_ptr[addr_width-1:0] 
                 == w_ptr[addr_width-1:0]) begin empty = 0; full = 1; end 
        else                               begin empty = 0; full = 0; end
    end
    
endmodule

