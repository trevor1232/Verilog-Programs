`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 01:33:20 AM
// Design Name: 
// Module Name: RegFile
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

//LdReg == write
module RegFile(clk, reset, WtData, LdReg, WtAdrs, RdAdrsA, RdAdrsB, RdDataA, RdDataB);
    input reset, clk, LdReg;
    input [7:0] WtData;
    input [2:0] WtAdrs;
    input [2:0] RdAdrsA;
    input [2:0] RdAdrsB;
    output [7:0] RdDataA;
    output [7:0] RdDataB;
    
reg [7:0] regfile [0:7];
assign RdDataA = regfile[RdAdrsA];
assign RdDataB = regfile[RdAdrsB];

integer i;
always@(posedge clk) 
    begin
    if(reset) begin
        for(i=0;i<8;i=i+1); begin
            regfile[i] <=8'b0;
         end
      end else begin
            if (LdReg) regfile[WtAdrs] <= WtData;
      end // else: !if(reseet)
   end

endmodule
