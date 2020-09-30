`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: April. 08, 2020   
* Version: 1.3 
*/


module challenge(clk,switches, buttons, cathode, anode, leds);
input [3:0]buttons;
output [7:0] cathode;
output [7:0] anode;
output [15:0] leds;
input clk;
input [15:0] switches;

reg tick;
reg [15:0] Switchq, nSwitchq;
reg [7:0] Data;
reg [2:0] RdAdrsA;
reg [2:0] RdAdrsB;
reg [2:0] WtAdrs;
reg [2:0] OpCode;
reg LdReg;
reg [7:0] RdDataA;
reg [7:0] RdDataB;
reg [7:0] RegFile [0:7];
reg [7:0] rotate;
reg [7:0] cathode, CATHODE;
reg [3:0] Nibble;
reg [2:0] count, ncount;
reg [16:0] counter, ncounter;
reg [7:0] anode, nanode;
reg [15:0] leds;

wire LdSw;
wire WtReg;
wire DoOp;
wire rst;
reg [8:0] AluOut;
reg zero;
reg carry;

assign rst = buttons[0];

debounce btn1(.clk(clk),.rst(rst), .btn(buttons[1]), .tick(tick), .ped(LdSw));  
debounce btn2(.clk(clk),.rst(rst), .btn(buttons[2]), .tick(tick), .ped(WtReg));  
debounce btn3(.clk(clk),.rst(rst), .btn(buttons[3]), .tick(tick), .ped(DoOp));  

integer i;
always@(posedge clk, posedge rst)
    begin
    if(rst)
        begin
        Switchq <= 16'b0;
        counter <= 17'b0;
        count <= 3'b0;
        anode <= 8'hFE;
        for(i=0; i<8; i=i+1)
            RegFile[i] <= 8'b0;
         end
         else 
            begin 
            Switchq <= nSwitchq;
            counter <=ncounter;
            count <= ncount;
            anode <= nanode;
            if(LdReg)
                RegFile[WtAdrs] <= (WtReg) ? Data :AluOut;
            end
        end
        
always @(*)
    begin
    RdAdrsB = Switchq[9:7];
    RdAdrsA = Switchq[12:10];
    WtAdrs = Switchq[15:13];
    OpCode = Switchq[2:0];
    Data = Switchq[7:0];
    leds = {rst,13'b0,carry,zero};
    
    if(LdSw) nSwitchq = switches;
    else nSwitchq = nSwitchq;
    
    case(count)
        3'b000: Nibble = AluOut [3:0];
        3'b001: Nibble = AluOut [7:4];
        3'b010: Nibble = RdDataB [3:0];
        3'b011: Nibble = RdDataB [7:4];
        3'b100: Nibble = RdDataA [3:0];
        3'b101: Nibble = RdDataA [7:4];
        3'b110: Nibble = Switchq [3:0];
        3'b111: Nibble = Switchq [7:4];
        endcase
        
    case(Nibble)
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
    
    tick = counter == 17'd99_999;
       
    if(tick)
        begin
        ncounter = 17'b0;
        ncount = count + 3'b1;
        nanode = {anode[6:0],anode[7]};
        end
        else
            begin
            ncounter = counter + 17'b1;
            ncount = count;
            nanode = anode;
            end
            
            
        rotate = {RdDataA[0], RdDataA[7:1]};
        carry = AluOut[8];
        zero = ~|AluOut;
        
        case(OpCode)
            3'b000: AluOut = RdDataA + RdDataB;
            3'b001: AluOut = RdDataA - RdDataB;
            3'b010: AluOut = RdDataA <<1;
            3'b011: AluOut = rotate;
            3'b100: AluOut = RdDataA & RdDataB;
            3'b101: AluOut = RdDataA | RdDataB;
            3'b110: AluOut = RdDataA ^ RdDataB;
            3'b111: AluOut = ~RdDataA;
        endcase

        
        RdDataA = RegFile[RdAdrsA];
        RdDataB = RegFile[RdAdrsB];
        LdReg = DoOp | WtReg;
        end
       
endmodule
