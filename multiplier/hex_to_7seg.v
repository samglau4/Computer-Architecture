`timescale 1ns / 1ps

module hex_to_7seg
(input [3:0] HEX, output reg [7:0] s);

    always@(HEX) begin
        casex (HEX)
            0:       s = 8'b 10001000;    
            1:       s = 8'b 11101101;    
            2:       s = 8'b 10100010;    
            3:       s = 8'b 10100100;    
            4:       s = 8'b 11000101;    
            5:       s = 8'b 10010100;    
            6:       s = 8'b 10010000;    
            7:       s = 8'b 10101101;    
            8:       s = 8'b 10000000;    
            9:       s = 8'b 10000100;
            10:      s = 8'b 10000001; // A    
            11:      s = 8'b 11010000; // b
            12:      s = 8'b 10011010; // C
            13:      s = 8'b 11100000; // d
            14:      s = 8'b 10010010; // E
            15:      s = 8'b 10010011; // F
            default: s = 8'b 01111111; 
        endcase
    end
endmodule

