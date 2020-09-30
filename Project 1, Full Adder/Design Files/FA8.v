`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
/*  
  * Author: Trevor Scott  
  * Email: scott.30trevor@gmail.com  
  * Filename: FullAdder8 Design File   
  * Date: January 28, 2020   
  * Version: 1.3   * 
  * Notes: This program copies the class of FA4 and implements two 4Fulladders and implements it in the design of 8FullAdder
*/ 
module FA8(A, B, Ci, Y, Co);
input [7:0] A,B;
input Ci;
output [7:0] Y;
output Co;

FA4 F_0 (
    .A(A[3:0]), 
    .B(B[3:0]), 
    .Ci(Ci), 
    .Y(Y[3:0]), 
    .Co(Co0)
);

FA4 F_1(
    .A(A[7:4]), 
    .B(B[7:4]), 
    .Ci(Co0), 
    .Y(Y[7:4]), 
    .Co(Co)
);


endmodule
