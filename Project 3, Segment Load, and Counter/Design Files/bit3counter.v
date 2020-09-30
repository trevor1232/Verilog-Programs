`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module bit3counter(reset, clk, mod8, tickin);
input clk, reset, tickin;
output reg [2:0] mod8;

always@(posedge clk, posedge reset)
if(reset) mod8 <= 3'b0; else
if(tickin) mod8 <= mod8 +3'b1;
    
endmodule
