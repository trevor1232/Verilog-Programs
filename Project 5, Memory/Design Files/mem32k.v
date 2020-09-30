`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2020 05:41:24 PM
// Design Name: 
// Module Name: mem32k
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


module mem32k(a,d,clk,we,spo);

input [14:0] a;
input [15:0] d;
input clk;
input we;
output [15:0] spo;

// Instantiate xilink ip

memory m1 (
    .a(a),
    .d(d),
    .we(we),
    .clk(clk),
    .spo(spo)
    );

/*
//declare memory 32kx16

reg [15:0] memory [0:32767];
reg [15:0] spo;

// read function

always @(*) spo = memory[a];

//write function

always@ (posedge clk)
    if (we) memory [a] <=d;
*/
endmodule
