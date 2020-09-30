`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2020 02:19:32 PM
// Design Name: 
// Module Name: MemControl
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


module MemControl(clk, rst, start, done, finish, write, loadA, loadD, pass, state, done);

//inputs for state machine
input start;
input done;
input finish;
input clk;
input rst;

//output for statemachine
output write;
output loadA;
output loadD;
output pass;
output state;

//to hold the state and or value for next output
reg [2:0] state;
reg [2:0] next_state;
reg [2:0] pass;
reg loadA,loadD,write;

//sequential logic
always @ (posedge clk, posedge rst) 
//when there is a rst state and next_state will begin with 0
    if (rst) begin
    state <= 3'b000;
    next_state <=3'b000;
    end
else begin
//wlse state willl copy next state
    state <= next_state;
    end
    
//comb. logic
always @(*)
    begin
    //if case is state
        case (state)
        //state 0 but this also works if you have loada,loadd,write,pass beging
        //as 1'b0 or if it begin at rst like that.
        //if start is true it will move to next state
        3'b000:{next_state,loadA,loadD,write,pass} = (start) ? {3'b001,loadA,loadD,write,pass} : {3'b000,1'b0,1'b0,1'b0,3'b000};
        3'b001:{next_state,loadA,write} = {3'b010,1'b1,1'b0};
        3'b010:{next_state,loadD,loadA} = {3'b011,1'b1,1'b0};
        3'b011:{next_state,write,loadD} = (done) ? {3'b100,1'b1,1'b0} : {3'b001, 1'b1, 1'b0};
        3'b100:{next_state,loadA,write} = {3'b101,1'b1,1'b0};
        3'b101:{next_state,loadD,loadA} = {3'b110,1'b1,1'b0};
        //if done is true wil move to next state else back to state 4
        3'b110:{next_state,loadD} = (done) ? {3'b111,1'b0} : {3'b100,1'b0};
        //if it's finish it will increment pass and go back to state 0
        3'b111:{next_state,pass} = (finish) ? {3'b001,3'b000} : {3'b001, pass+1};

    endcase
    end

endmodule

