`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2020 11:35:57 PM
// Design Name: 
// Module Name: hex_to_sseg
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



module hex_to_sseg(
    input wire [3:0] hex,
    input wire dp,
    output reg [7:0] cathode
    );
     
    always@*
    begin
        case(hex)
        //hexadecimal
            4'b0000:cathode=8'h3F;//0
            4'b0001:cathode=8'h06;
            4'b0010:cathode=8'h1F;
            4'b0011:cathode=8'h4F;
            4'b0100:cathode=8'h66;
            4'b0101:cathode=8'h6D;
            4'b0110:cathode=8'h7D;
            4'b0111:cathode=8'h07;
            4'b1000:cathode=8'h7F;
            4'b1001:cathode=8'h6F;
            4'b1010:cathode=8'h77;
            4'b1011:cathode=8'h7C;
            4'b1100:cathode=8'h39;
            4'b1101:cathode=8'h5E;
            4'b1110:cathode=8'h79;
            4'b1111:cathode=8'h71;  
        endcase             
    cathode.out=~cathode;
    end  
endmodule

/*
module hex-to-sseg
(
input wire [3:01 hex,
input wire dp,
5 output reg [7:0] sseg // output active low
1;
always Q*
begin
case (hex)
4'hO: sseg [6: 01 = 7'b0000001;
4'hl: sseg[6:0] = 7'b1001111;
4'h2: sseg [6:0] = 7'b0010010;
4'h3: sseg [6:01 = 7'b0000110;
4'h4: sseg[6:0] = 7'b1001100;
4'h5: sseg [6:0] = 7'b0100100;
4'h6: sseg [6:01 = 7'b0100000;
4'h7: sseg[6:0] = 7'bOOOlill;
4'h8 : sseg C6: 01 = 7' b0000000 ;
4'h9 : sseg [6: 01 = 7'b0000100 ;
4'ha: sseg [6:01 = 7'b0001000;
4'hb: sseg [6:0] = 7'b1100000;
4'hc: sseg[6:0] = 7'b0110001;
4'hd: sseg [6:01 = 7'blOOOOlO;
4'he: sseg C6:Ol = 7'b0110000;
default: sseg [6:01 = 7'b0111000; //4 'hf
endcase
sseg [71 = dp; 
*/
/*

module hex_to_sseg(
    input wire [3:0] hex,
    input wire cathode,
    output reg [7:0] sseg
    );
     
    always@*
    begin
        case(hex)
        //hexadecimal
            4'b0000:cathode=8'h3F;//0
            4'b0001:cathode=8'h06;
            4'b0010:cathode=8'h1F;
            4'b0011:cathode=8'h4F;
            4'b0100:cathode=8'h66;
            4'b0101:cathode=8'h6D;
            4'b0110:cathode=8'h7D;
            4'b0111:cathode=8'h07;
            4'b1000:cathode=8'h7F;
            4'b1001:cathode=8'h6F;
            4'b1010:cathode=8'h77;
            4'b1011:cathode=8'h7C;
            4'b1100:cathode=8'h39;
            4'b1101:cathode=8'h5E;
            4'b1110:cathode=8'h79;
            4'b1111:cathode=8'h71;  
        endcase             
    cathode.out=~cathode;
    end  
endmodule
*/