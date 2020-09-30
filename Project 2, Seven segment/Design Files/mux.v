`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module mux(inVal, sel, hexVal);

    input [31:0] inVal; 
    input [2:0] sel;
    output [3:0] hexVal;

    reg [3:0] hexVal;
    always@*
    begin
        case(sel)
        3'b000:hexVal = inVal[3:0];
        3'b001:hexVal = inVal[7:4];
        3'b010:hexVal = inVal[11:8];
        3'b011:hexVal = inVal[15:12];
        3'b100:hexVal = inVal[19:16];
        3'b101:hexVal = inVal[23:20];
        3'b110:hexVal = inVal[27:24];
        3'b111:hexVal = inVal[31:28];
        endcase
    end
    
endmodule
