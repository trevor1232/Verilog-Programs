`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module Pulse(clk, reset, pulse);
input clk;
input reset;
output pulse;

reg [16:0] count, ncount;
wire pulse;

// 1MS PULSE GENERATOR
assign pulse = (count == 17'd99_999);

always @(posedge clk, posedge reset)
    if(reset) count <= 17'b0;
    else count <= ncount;
    
always @(*)
    if (pulse) ncount = 17'b0;
    else ncount = count + 17'b1;    

endmodule
