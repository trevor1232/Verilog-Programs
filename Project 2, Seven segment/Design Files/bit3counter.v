`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module bit3counter(reset, clk, mod8, tickin1);
input clk, reset, tickin1;
output reg [2:0] mod8;

always@(posedge clk, posedge reset)
if(reset) mod8 <= 3'b0; else
if(tickin1) mod8 <= mod8 +3'b1;
    
endmodule
