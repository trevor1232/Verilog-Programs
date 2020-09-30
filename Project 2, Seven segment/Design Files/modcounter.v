`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2020 10:48:19 PM
// Design Name: 
// Module Name: modcounter
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


module modcounter(clk, reset, q );

input clk, reset;
output [7:0] q;

reg [7:0] q;

always @(posedge clk, posedge reset)
    if(reset) q<= 3'b0;
    else q<= q + 3'b1;
endmodule
