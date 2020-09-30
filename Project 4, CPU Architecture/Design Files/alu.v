`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2020 10:20:45 PM
// Design Name: 
// Module Name: alu
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


module alu(RdDataA,RdDataB,OpCode, zero, carry, AluOut);

input [2:0] OpCode;
input [7:0] RdDataA,RdDataB;
output zero;
output reg carry;
output reg [7:0] AluOut;

assign zero = ~|AluOut;
//comb.
always@(*)
    case(OpCode)
        3'b000: {carry, AluOut} = RdDataA + RdDataB;
        3'b001: {carry, AluOut} = RdDataA - RdDataB;
        3'b010: AluOut = RdDataA <<1;
        3'b011: AluOut = {RdDataA[0], RdDataA[7:1]};
        3'b100: AluOut = RdDataA & RdDataB;
        3'b101: AluOut = RdDataA | RdDataB;
        3'b110: AluOut = RdDataA ^ RdDataB;
        3'b111: AluOut = ~RdDataA;
        default: AluOut = 3'b000;
    endcase

endmodule
