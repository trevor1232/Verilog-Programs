`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2020 02:37:30 AM
// Design Name: 
// Module Name: Debounce
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

//load is from pulse
module Debounce(button, clk, rst, load, shift, db);
// leave button alone?
input load, clk, rst, button;
output reg db;
output [9:0]shift;
reg [9:0] shift;

always@( posedge clk, posedge rst)
if(rst) shift <= 10'b11111_11110; else 
if(load) shift <= {shift[8:0], shift[9]};


always@(*)
begin
    db = shift[9]&shift[8]&shift[7]&shift[6]&shift[5]&shift[4]&shift[3]&shift[2]&shift[1]&shift[0];
    db=&shift;
end

endmodule
