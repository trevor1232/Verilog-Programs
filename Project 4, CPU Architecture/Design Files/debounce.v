`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: April. 08, 2020   
* Version: 1.3 
*/

module debounce(clk, rst, btn, tick, ped);
input clk;
input rst;
input btn;
input tick;
output ped;
//shift reg from all consecutives 1 in a row of 10
reg [9:0] shiftreg, nshisftreg;
wire db;
reg  [1:0] pedq, npedq;
wire ped;

always@(posedge clk, posedge rst)
    if(rst) {shiftreg,pedq} <= {10'b0, 2'b0};
    else {shiftreg,pedq} <= {nshisftreg,npedq};
    
always@(*)
    if(tick) nshisftreg = {shiftreg[8:0], btn};
    else nshisftreg = shiftreg;
assign db = &shiftreg;

always@(*)
    npedq = {db,pedq[1]};
    
assign ped = pedq[1] & pedq[0];
       
endmodule


