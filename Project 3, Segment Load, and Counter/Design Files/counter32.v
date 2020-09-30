`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/
//a loadable 32 counter
module counter32(reset, clk, pedin, qout);
input reset, clk, pedin;
output reg [31:0] qout;
always@(posedge clk, posedge reset)
if(reset) qout<= 32'b0;else 
if(pedin) qout<= qout + 32'b1;
endmodule
