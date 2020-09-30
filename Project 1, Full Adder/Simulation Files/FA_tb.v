`timescale 1ns / 1ps
/*  
  * Author: Trevor Scott  
  * Email: scott.30trevor@gmail.com  
  * Filename: FullAdder_tf  
  * Date: January 28, 2020   
  * Version: 1.3   * 
  * Notes: From beachboard
*/


module FA_tb();

reg  [0:0] A;
reg  [0:0] B;
reg       Ci;
wire [0:0] Y;
wire       Co;

integer    i;
  
  //instantiate the device under test;  
  FA FA(
          .A(A), 
          .B(B), 
          .Ci(Ci), 
          .Y(Y), 
          .Co(Co)
          );

//generate the stimulus

initial begin
   A  = 0;
   B  = 0;
   Ci = 0;
   i  = 0;
   
   for (i=0; i<16; i = i + 1)
      begin
      #50 
      A  = $random;
      B  = $random;
      Ci = $random;
      
      #50
      if (Y != A+B+Ci) $display("Error!");
      end
   end
   
endmodule
