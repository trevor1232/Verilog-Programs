`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2020 06:46:45 PM
// Design Name: 
// Module Name: Mem_top
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


module Mem_top(clk, rst, start, finish, error);

//data inputs
input clk;
input rst;
input start; 

//data outputs
output finish; 
output error; 

//wires from instan.
wire [15:0] rdata; 
wire write;
wire [14:0] adres;
wire [15:0] wdata;
wire        error;

wire done;
wire finish;
wire loadA;
wire loadA;
wire [2:0] pass;
wire [2:0] state;

//instaniate designs below
MemControl Mem_SM(.clk(clk),
    .rst(rst),
    .start(start),
    .done(done),
    .finish(finish),
    .write(write),
    .loadA(loadA),
    .loadD(loadD),
    .pass(pass),
    .state(state)
    );

SuppLogic supl(.clk(clk),
    .rst(rst),
    .pass(pass),
    .loadA(loadA),
    .loadD(loadD),
    .state(state),
    .wdata(wdata),
    .adrs(adres),
    .rdata(rdata),
    .finish(finish),
    .error(error),
    .done(done)
    );

memory mem (.a(adres),
    .d(wdata),
    .we(write),
    .clk(clk),
    .spo(rdata)
    );

endmodule
