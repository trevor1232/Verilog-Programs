`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module hex_to_sseg(
    input wire [3:0] hex,
    output reg [7:0]cathode_out
    );
     
    reg [7:0] cathode; 
    always@*
    begin
        case(hex)
        //hexadecimal
            4'b0000:cathode=8'h3F;//0
            4'b0001:cathode=8'h06;
            4'b0010:cathode=8'h5B;
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
    cathode_out=~cathode;
    end  
endmodule

