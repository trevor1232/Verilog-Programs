`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module Shift10(reset, clk, pulsein, db, btn);
input reset, clk, pulsein, btn;
//after and gate db will be left and will be a wire for PED
// 1 bit wide (WIRE)
output wire db;
//the mediator between the circuit
reg [9:0] q;

always@(posedge clk, posedge reset)
if(reset) q <= 10'b0; else
//just like jk flop both have to be a one for it pass through data 
//every 1 or 10 ms(FROM PULSE) it will starting adding ones untill the whole 10 bit is full of ones then
// it will go to PED
if(pulsein) q <= {btn,q[9:1]};

//assign is used since it will be connected via wire with PED
//when all of q are ones then it will send the data to ped
assign db = &q;
endmodule
