`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 09:33:38 AM
// Design Name: 
// Module Name: Top_tf
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


module Top_tf(

    );
    wire TxD;
    // LED has nothing to recieved so it will just be X
    wire [7:0] LED;
    reg clk, RxD, ReadySW;
    reg [7:0] SW;
    reg [7:0] count;
    
    integer i;
    
    serialGPIO unit0(.clk(clk), .LED(LED), .RxD(RxD), .ReadySW(ReadySW), .SW(SW), .TxD(TxD));
    
    initial begin
      clk=1;
      RxD=1;
      ReadySW=1;
      
      // where it will start
      SW=8'b00000000;
      count = 8'b00000000;
      
      // will test every case on switches
      for(i=0; i<256; i=i+1) begin
      #10
        count = count + 1'b1;
        SW[0]= count[0];
        SW[1]= count[1];
        SW[2]= count[2];
        SW[3]= count[3];
        SW[4]= count[4];
        SW[5]= count[5];
        SW[6]= count[6];
        SW[7]= count[7];
      end
   end
   
    always #5 clk=~clk;

endmodule
