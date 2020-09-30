`timescale 1ns / 1ps
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: Design file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/

module Top_LevelD(button, clk, reset, anode, cathode);
input clk, reset, button;
output [7:0] anode;
output [7:0] cathode;
wire [31:0] qout;
wire [2:0]  mod8;
wire [3:0] hexVal;
wire tick, ped, db, pulse;


Pulse t_0(
    .clk(clk),
    .reset(reset),
    .pulse(pulse));

Shift10 t_1(
    .clk(clk), 
    .reset(reset),
    .db(db),
    .pulsein(pulse),
    .btn(button)); 
    
PED t_2(
    .clk(clk),
    .reset(reset),
    .Din(db),
    .ped(ped));
    
counter32 t_3(
    .reset(reset),
    .clk(clk),
    .pedin(ped),
    .qout(qout[31:0]));
    
bit3counter t_4(
    .tickin(tick),
    .reset(reset),
    .clk(clk),
    .mod8(mod8));
    
//try other way
mux t_5(
    .inVal(qout[31:0]),
    .sel(mod8),
    .hexVal(hexVal));

hex_to_sseg t_6(
    .hex(hexVal),
    .cathode_out(cathode[7:0]));  

test t_7(
    .clk(clk),
    .reset(reset),
    .tick(tick)); 

shifter t_8(
    .clk(clk),
    .reset(reset),
    .tickin(tick),
    .shift(anode[7:0]));

endmodule
