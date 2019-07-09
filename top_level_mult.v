`timescale 1ns / 1ps

module top_level_mult (input [3:0] A, B, input reset, EN, button, clk100MHz, output [7:0] LEDSEL, LEDOUT);
    wire button_debounced, clk5KHz, DONT_USE;
    wire [7:0] display_A, display_B, Y_total, Y1, Y0;
    
    supply1 [7:0] vcc;
    
    clk_gen U0(clk100MHz, reset, DONT_USE, clk5KHz);
    debouncer U1(clk5KHz, button, button_debounced);
    
    hex_to_7seg U2(A[3:0], display_A);
    hex_to_7seg U3(B[3:0], display_B);
    
    pipeline_multiplier U4(A, B, button_debounced, reset, EN, Y_total);
    
    hex_to_7seg U5(Y_total[7:4], Y1);
    hex_to_7seg U6(Y_total[3:0], Y0);
    
    led_mux U7(clk5KHz, reset, display_A, vcc, vcc, display_B, vcc, vcc, Y1, Y0, LEDSEL, LEDOUT);
endmodule