`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2020 02:28:21 AM
// Design Name: 
// Module Name: async_receiver
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


module async_receiver(
	input clk,
	input RxD,
	input OversamplingTick,
	output reg RxD_data_ready,
	output reg [7:0] RxD_data  // data received, valid only (for one clock cycle) when RxD_data_ready is asserted

);

// 16 is usually the best for sampling and gerbish data
parameter Oversampling = 16'b1;  

// 4 bit state machine in value of 0 until it starts to recieve data
reg [3:0] RxD_state = 0;

// synchronize RxD to our clk domain
reg [1:0] RxD_sync = 2'b11;
always @(posedge clk) 
    if(OversamplingTick)
         RxD_sync <= {RxD_sync[0], RxD};

// and filter it
reg [1:0] Filter_cnt = 2'b11;
reg RxD_bit = 1'b1;

// this is just to filter and decide when is the good time to sample the RxD line

always @(posedge clk)
if(OversamplingTick)
begin

	if(RxD_sync[1]==1'b1 && Filter_cnt!=2'b11) 
	   Filter_cnt <= Filter_cnt + 1'd1;
	else if(RxD_sync[1]==1'b0 && Filter_cnt!=2'b00) 
	   Filter_cnt <= Filter_cnt - 1'd1;

	if(Filter_cnt==2'b11 &&RxD_sync[1]==1'b1 ) 
	   RxD_bit <= 1'b1;
	else if(Filter_cnt==2'b00 && RxD_sync[1]==1'b0 ) 
	   RxD_bit <= 1'b0;

end

reg [3:0] counter =4'b1111;

// the code below is needed or else the recieving end of the FPGA will misread the data
// so a double tick will be ANDED to ensure BAUD RATE
wire OversamplingCnt;
mod_m_counter #(.M(16), .N(4)) tick_gen1(.clk(clk), .reset(reset), .q(), .max_tick(OversamplingCnt));
wire sampleNow;
assign sampleNow = OversamplingTick && OversamplingCnt;



// now we can accumulate the RxD bits in a shift-register
always @(posedge clk)
case(RxD_state)
	4'b0000: if(~RxD_bit)  RxD_state <= 4'b0001;  // start bit found?
	4'b0001: if(sampleNow) RxD_state <= 4'b1000;  // sync start bit to sampleNow for SEQU BLK
	4'b1000: if(sampleNow) RxD_state <= 4'b1001;  // bit 0
	4'b1001: if(sampleNow) RxD_state <= 4'b1010;  // bit 1
	4'b1010: if(sampleNow) RxD_state <= 4'b1011;  // bit 2
	4'b1011: if(sampleNow) RxD_state <= 4'b1100;  // bit 3
	4'b1100: if(sampleNow) RxD_state <= 4'b1101;  // bit 4
	4'b1101: if(sampleNow) RxD_state <= 4'b1110;  // bit 5
	4'b1110: if(sampleNow) RxD_state <= 4'b1111;  // bit 6
	4'b1111: if(sampleNow) RxD_state <= 4'b0010;  // bit 7
	4'b0010: if(sampleNow) RxD_state <= 4'b0000;  // stop bit
	default: RxD_state <= 4'b0000;
endcase

always @(posedge clk)
    // when sample is active and RxD is in it's last state
    if(sampleNow && RxD_state[3]) 
        //this will start transfering data
        RxD_data <= {RxD_bit, RxD_data[7:1]};

always @(posedge clk)
    begin
        // stop bit, samplenow, and RxD_bit
        RxD_data_ready <= (sampleNow && RxD_state==4'b0010 && RxD_bit);  // make sure a stop bit is received
    end
endmodule

