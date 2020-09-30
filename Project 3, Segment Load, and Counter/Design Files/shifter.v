`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module shifter(reset, clk, tickin, shift);
input reset, clk;
input tickin;
output [7:0]shift;
reg [7:0] shift;

always@( posedge clk, posedge reset)
if(reset) shift <= 8'b1111_1110; else 
if(tickin) shift <= {shift[6:0], shift[7]};




endmodule
