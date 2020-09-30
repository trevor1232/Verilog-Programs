`timescale 1ns / 1ps
/*  
  * Author: Trevor Scott  
  * Email: scott.30trevor@gmail.com  
  * Filename: FullAdder4 Design File   
  * Date: January 28, 2020   
  * Version: 1.3   * 
  * Notes: This program copies the class of FA and implements four Fulladders and implements it in the design of 4FullAdder
*/


module FA4(A,B,Ci,Y,Co);
input  [3:0] A, B; // data inputs
input        Ci;   // carry in
output [3:0] Y; // sum
output       Co; // Carry out

//making functions for ADDERS!
FA FA3 (.A(A[3]), .B(B[3]), .Ci(Co2), .Y(Y[3]), .Co(Co));
FA FA2 (.A(A[2]), .B(B[2]), .Ci(Co1), .Y(Y[2]), .Co(Co2));
FA FA1 (.A(A[1]), .B(B[1]), .Ci(Co0), .Y(Y[1]), .Co(Co1));
FA FA0 (.A(A[0]), .B(B[0]), .Ci(Ci), .Y(Y[0]), .Co(Co0));

endmodule
