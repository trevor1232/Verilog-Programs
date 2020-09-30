`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2020 07:12:05 PM
// Design Name: 
// Module Name: SuppLogic
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SuppLogic(clk,rst,pass,loadA,loadD,state,wdata,adrs,rdata,finish,done,error);

input clk;
input rst;
input loadA;
input loadD;
input [2:0] pass;
input [15:0] rdata;
input [2:0] state;

output [15:0] wdata;
output [14:0] adrs;
output finish;
output error;
output done;


reg [14:0] adreg;
reg [15:0] dtreg;
reg [15:0] muxdat;
wire [2:0] pass;
wire finish;
wire done;
wire [15:0] wdata;
wire [14:0] adrs;
wire errorD;
reg  error;
wire [2:0] state;


assign finish = pass == 3'b100;
assign done = adreg == 15'h7FFF;
assign adrs = adreg;
assign wdata = dtreg;
assign errorD = (state == 3'b100) & (dtreg!== rdata) & (!done);

//flop
always @ (posedge clk, posedge rst)
    if (rst) adreg <=15'h7FFF;
    else if (loadA) adreg <= adreg + 15'b1;
always @ (posedge clk, posedge rst)
    if (rst) dtreg <= 16'b0;
    else if (loadD) dtreg <=muxdat;
    //data selector
always@(*)
    case(pass)
        3'b011 : muxdat = 16'hAAAA;
        3'b010: muxdat = 16'h5555;
        3'b001: muxdat = {1'b0,adreg};
        3'b000: muxdat= ~adreg;
        default: muxdat = 16'h1234;
    endcase

always @(posedge clk, posedge rst)
    if (rst) error <= 1'b0;
    else if (errorD) error <= 1'b1;
    else error <= error;
endmodule
