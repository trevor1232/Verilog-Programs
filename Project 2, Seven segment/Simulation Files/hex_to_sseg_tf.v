`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 01:34:04 AM
// Design Name: 
// Module Name: hex_to_sseg_tf
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


module hex_to_sseg_tf(
    input wire clk,
    input wire [7:0] sw,
    output wire [3:0] anode,
    output wire [7:0] cathode
    );
    
    //signal declaration
    wire [7:0] inc;
    wire [7:0] led0, led1, led2, led3, led4, led5, led6, led7;
    
    //increment input
    //ASK WHAT IS THIS
    assign inc =  sw+1;
    
    //instantiate four instances of hex decoders
    // instance for 4 LSBs of input
    hex_to_sseg sseg_unit0(
        .hex(sw[3:0]),
        .dp(1'b0), 
        .cathode(led0));
        
    hex_to_sseg sseg_unit1(
        .hex(sw[7:4]),
        .dp(1'b0), 
        .cathode(led1));
        
     hex_to_sseg sseg_unit2(
        .hex(inc[3:0]),
        .dp(1'b1), 
        .cathode(led2));
        
      hex_to_sseg sseg_unit3(
        .hex(inc[7:4]),
        .dp(1'b1), 
        .cathode(led3));
     /*   
      disp_mux disp_unit(
        .clk(clk),
        .reset(1'b0),
        .in0(led0),
        .in1(led1),
        .in2(led2),
        .in3(led3),
        .anode(anode),
        .cathode(cathode));
        */
    
endmodule


