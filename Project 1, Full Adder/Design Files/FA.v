`timescale 1ns / 1ps
/*  
  * Author: Trevor Scott  
  * Email: scott.30trevor@gmail.com  
  * Filename: FullAdder Design File   
  * Date: January 28, 2020   
  * Version: 1.3   * 
  * Notes: We use a continuous block to perform Y (sum) equation, and Co (Carry out) equation
*/ 

module FA(A, B, Ci, Y, Co);

input A, B, Ci;
output Y, Co;

wire Co, Y;

assign  Y = A ^ B ^ Ci;
assign  Co = (A&B)|(A&Ci)|(B&Ci);



endmodule
