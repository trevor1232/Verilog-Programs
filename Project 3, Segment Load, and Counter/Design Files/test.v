`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module test(clk, reset, tick);
input clk;
input reset;
output tick;

reg [12:0] count, ncount;
wire tick;

assign tick = (count == 13'd4999);

always @(posedge clk, posedge reset)
    if(reset) count <= 13'b0;
    else count <= ncount;
    
always @(*)
    if (tick) ncount = 13'b0;
    else ncount = count + 13'b1;    

endmodule
