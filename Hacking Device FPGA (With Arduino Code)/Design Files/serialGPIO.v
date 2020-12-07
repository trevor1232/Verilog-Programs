`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2020 02:32:47 AM
// Design Name: 
// Module Name: serialGPIO
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


module serialGPIO(
    input clk,
    input RxD,
    output TxD,
    output reg [7:0] LED,  
    input [7:0] SW,  
    input ReadySW

);
parameter DVSR = 651, // From Calculation based on clk, and baud rate
          DVSR_BIT =10; // how many bits it takes to reach or be greater than 651, 2^10 > 651

wire tick;
wire RxD_Data_Ready;
wire [7:0] RxD_data;
wire StartTx; 

assign StartTx = ReadySW&~RxD_Data_Ready; 

// Baud Rate generator, also tick is what will output after baudrate is pulsed
mod_m_counter #(.M(DVSR), .N(DVSR_BIT)) tick_gen(.clk(clk), .reset(reset), .q(), .max_tick(tick));
async_receiver RX(.clk(clk), .RxD(RxD), .RxD_data_ready(RxD_Data_Ready), .RxD_data(RxD_data), .OversamplingTick(tick));
BaudTickGen #(100000000, 9600) tickgen(.clk(clk), .enable(TxD_busy), .tick(BitTick));
async_transmitter TX(.clk(clk), .TxD(TxD), .TxD_start(StartTx), .BitTick(BitTick), .TxD_data(SW), .TxD_busy(TxD_busy));

always @(posedge clk) 
    begin
    if(RxD_Data_Ready) 
        begin 
   // will gather the recieving bits from RxD_Data, will corresspond to each bit
        LED <= RxD_data;
        end
    end
    
endmodule
