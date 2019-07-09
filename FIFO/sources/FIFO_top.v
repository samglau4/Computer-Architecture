`timescale 1ns / 1ps

module FIFO_fpga
(input [3:0] in,
 input wnr, reset, EN, button, clk100MHz,
 output [3:0] out, 
 output full, empty);

    supply1 [7:0] vcc;
    wire clk5KHz, bDebounced, DONT_USE;
    //wire [3:0] out;
    
    clk_gen   u0 (clk100MHz, reset, DONT_USE, clk5KHz);
    debouncer u1 (clk5KHz, button, bDebounced);
    
    FIFO      u2 (wnr, EN, bDebounced, reset, in,
                  out, full, empty);

endmodule
