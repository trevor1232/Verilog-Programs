`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 01:55:59 PM
// Design Name: 
// Module Name: rotator
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

// include tick...
module rotator(clk, reset, rotate);
input clk, reset;
output rotate;

reg [17:0] counter;

// we need at least 18 bits since 2^18 fills in how many clocks we need
//rotator shifter
assign rotate = (counter == 18'd199_999); 


//rotator shifter for anode
always@(posedge clk, posedge reset)
    if(reset) counter <= 18'b0; else
    if(rotate) counter <= 18'b0;
    else counter <= counter + 18'b1;
    
    
// mux selector


    
endmodule
