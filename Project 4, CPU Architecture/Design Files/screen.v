`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 12:21:01 AM
// Design Name: 
// Module Name: screen
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


module screen(clk, reset, anode, RdDataA, RdDataB, MuxD, ALUOUT, cathode );
    input clk, reset;
    input [7:0] MuxD, ALUOUT, RdDataA, RdDataB;
    output reg [7:0] anode;
    output reg [7:0] cathode;
    reg [7:0] count;
    reg [3:0] nibble;
    reg [2:0] hexLoc, nhexLoc;
    reg CATHODE;
    reg [31:0] ssg;
    
    assign tick = count == 17'd99_999;
    always@*
        begin   
            ssg = {MuxD,anode,cathode,ALUOUT};
            case(hexLoc)
                3'b000: nibble = ssg[3:0];
                3'b001: nibble = ssg[7:3];
                3'b010: nibble = ssg[11:8];
                3'b011: nibble = ssg[15:12];
                3'b100: nibble = ssg[19:16];
                3'b101: nibble = ssg[23:20];
                3'b110: nibble = ssg[27:24];
                3'b111: nibble = ssg[31:28];
            endcase
            
            case (nibble)
            4'b0000:CATHODE=8'h3F;//0
            4'b0001:CATHODE=8'h06;
            4'b0010:CATHODE=8'h5B;
            4'b0011:CATHODE=8'h4F;
            4'b0100:CATHODE=8'h66;
            4'b0101:CATHODE=8'h6D;
            4'b0110:CATHODE=8'h7D;
            4'b0111:CATHODE=8'h07;
            4'b1000:CATHODE=8'h7F;
            4'b1001:CATHODE=8'h6F;
            4'b1010:CATHODE=8'h77;
            4'b1011:CATHODE=8'h7C;
            4'b1100:CATHODE=8'h39;
            4'b1101:CATHODE=8'h5E;
            4'b1110:CATHODE=8'h79;
            4'b1111:CATHODE=8'h71;  
        endcase             
    cathode=~CATHODE;
    
        if(hexLoc == 3'b111)
            nhexLoc =1'b0; else
            nhexLoc = hexLoc +3'b1;
       end
    always@(posedge clk, posedge reset)
        if(reset)
            begin
            count <= 17'b0;
            anode <= 8'hfe;
            hexLoc <=3'b0;
            end
        else if (tick)
            begin 
            count <= 17'b0;
            anode <={anode[0],anode[7:1]};
            hexLoc <= nhexLoc;
            end
        else count <= count +17'b1;   
endmodule

