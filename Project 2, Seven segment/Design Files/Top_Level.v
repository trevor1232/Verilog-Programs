`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/
//clk, sw, reset, anode,cathode
module Top_Level(clk, reset, SW, anode, cathode );

input clk, reset;
input [15:0] SW;
output [7:0] anode;
output [7:0] cathode;


//ineer connect the proper widths!

wire [2:0] mod8;
wire [3:0] hexVal;
wire tick;
test r_0(
    .clk(clk),
    .reset(reset),
    .tick(tick)
    );

shifter s_0(
    .clk(clk),
    .reset(reset),
    .tickin(tick),
    .shift(anode[7:0])
);

bit3counter b_0(
    .clk(clk),
    .reset(reset),
    .tickin1(tick),
    .mod8(mod8)
);

mux m_0(
    .sel(mod8),
    .inVal({SW[15:0],SW[15:0]}),
    .hexVal(hexVal)   
    );
hex_to_sseg sh_0(
     .hex(hexVal),
     .cathode_out(cathode[7:0])
    );

endmodule
