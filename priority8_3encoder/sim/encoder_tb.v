`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2018 04:41:56 PM
// Design Name: 
// Module Name: encoder_tb
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
// GOT HELP FROM ANDREW(MASTERS STUDENT WITH THE CONCEPT NOT THE CODE
//////////////////////////////////////////////////////////////////////////////////


module encoder_tb;
reg [7:0] A;
//wire valid;
//wire [2:0] Y;

wire [2:0] Y_if;
wire [2:0]  Y_for;
wire [2:0] Y_casez;

wire Valid_if;
wire Valid_for;
wire Valid_casez;


encoder_if DUT0(A, Y_if, Valid_if);
encoder_for DUT1(A, Y_for, Valid_for);
encoder_casez DUT2(A, Y_casez, Valid_casez);

integer Valid;
integer N;
integer expected;

initial begin
for(N = 0; N < 256; N = N + 1)
begin
A = N;

if (A >= 128)
begin
expected = 7;
Valid = 1;
end

else if (A >= 64)
begin
expected = 6;
Valid = 1;
end

else if (A >= 32)
begin
expected = 5;
Valid = 1;
end

else if (A >= 16)
begin
expected = 4;
Valid = 1;
end


else if (A >= 8)
begin
expected = 3;
Valid = 1;
end

else if (A >= 4)
begin
expected = 2;
end

else if (A >= 2)
begin
expected = 1;
Valid = 1;
end


else if (A >= 1)
begin
expected = 0;
Valid = 1;
end

else if (A >= 0)
begin
expected = 3'bx;
Valid = 0;
end #5;

end // forloop

if(Y_if != expected)
 begin
 $display("Test failed for Y value for if");
 $finish;
 end
 
 if(Y_for != expected)
  begin
  $display("Test failed for Y value for FOR");
  $finish;
  end
  
   if(Y_casez != expected)
   begin
   $display("Test failed for Y value for casez");
   $finish;
   end
   
   // If_Statements for valid
   if(Valid_if != Valid)
   begin
   $display("Test failed for valid value for if");
   $finish;
   end
   
   if(Valid_for != Valid)
   begin
   $display("Test failed for valid value for for");
   $finish;
   end

   if(Valid_casez != Valid)
   begin
   $display("Test failed for valid value for for");
   $finish;
   end
   
end // end of inital begin
endmodule
