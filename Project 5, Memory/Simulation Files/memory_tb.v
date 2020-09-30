`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/06/2020 05:49:58 PM
// Design Name: 
// Module Name: memory_tb
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


module memory_tb();

reg clk;
reg we;
reg [14:0] a;
reg [15:0] d;
wire [15:0] spo;

integer i;

//instanitate the design
mem32k mem(.clk(clk),.a(a),.d(d),.we(we),.spo(spo));

// generate clock
always #5 clk = ~clk;

//excercise

initial begin
    clk = 0;
    a = 0;
    we = 0;
    d = 0;
    #100
    for (i =0; i<32769; i = i+1)
        begin 
        @(posedge clk)
        we = 1;
        a = i;
        d = i;
        @(posedge clk)
        we = 0;
        repeat(5) @(posedge clk);
        end
    #100 
    for (i = 0; i <32769; i = i+1)
        begin
        @ (posedge clk)
        a = i;
        @ (posedge clk)
        #5
        if (spo !== i [15:0]) $display ("Error");
        repeat(5) @ (posedge clk);
        end
end

endmodule
