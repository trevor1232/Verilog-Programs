`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2020 10:49:28 PM
// Design Name: 
// Module Name: Mem_top_tb
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


module Mem_top_tb();

reg clk;
reg rst;
reg start;

wire finish;
wire error;

Mem_top Mem_top(
    .clk(clk),
    .rst(rst),
    .start(start),
    .finish(finish),
    .error(error)
    );
    
always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    start = 0;
    #100
    rst = 0;
    #100
    start = 1;
    #100;
    end
    
always @(posedge finish)
    begin
    $display("Finished");
    $finish;
    end 
    
endmodule
