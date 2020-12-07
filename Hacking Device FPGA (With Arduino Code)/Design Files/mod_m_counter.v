`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2020 08:02:39 PM
// Design Name: 
// Module Name: mod_m_counter
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

module mod_m_counter
    #(
    // this is subjected to changed when assigning these values in instanisting them. 
    parameter N=4, // number of bits in counter 
              M=10 // mod-(M) the limits for the counter
    )
    (clk, reset, max_tick,q);
    input wire clk, reset;
    output wire max_tick;
    output wire [N-1:0] q;
    
    // signal declaration
    
    // reg: r_reg will retain the information or state as in registers
    reg [N-1:0] r_reg;
    // will be used to connect an element to another, needs to be driven in design to store the value.
    wire [N-1:0] r_next;
    
    // body of the Program
    // register
    always@(posedge clk, posedge reset)
        if(reset) 
        // Will be 0
            r_reg <=0;
        else
        // Will gain the value from the wire that is being driven by clk
            r_reg <= r_next;
            
    // next state logic
    //wires so we can simply assign them a logical equation as in respect to a counter. 
    assign r_next = (r_reg == (M-1)) ? 0: r_reg+1;
    // output logic
    // will constanly be updated based on r_next.
    assign q = r_reg;
    // Final code for how many ticks utlized.
    assign max_tick = (r_reg ==(M-1)) ? 1'b1:1'b0;
endmodule

