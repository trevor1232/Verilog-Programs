`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

//ped is doit
module PED(clk, reset, Din, ped);
input Din, reset, clk;
output ped;
reg q1,q2;
reg nq1, nq2;
assign ped = q1&~q2;

always@(*)
begin
   nq1 = Din;
   nq2 = q1; 
end
always@(posedge clk, posedge reset)
    if(reset) {q1, q2} <=2'b0;
    else {q1,q2} <={nq1, nq2};
endmodule
