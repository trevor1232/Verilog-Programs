`timescale 1ns/1ns
/*
    Trevor Scott   
* Email: scott.30trevor@gmail.com  
* Filename: simulation file  
* Date: Feb. 24, 2020   
* Version: 1.3 
*/
module SevenSegmentDisplay_tf();

reg           clk;         //100Mhz clock
reg           rst;         //HA asynchronous reset
reg    [15:0] SW;    //data to display on Seven Segment Display
wire   [ 7:0] cathode;     //seven segment cathode signals
wire   [ 7:0] anode;       //seven segment anode signals
reg    [ 3:0] SW;      //for testing

/////////////////////////////////////////////////////////
// instantiate the device under test
/////////////////////////////////////////////////////////
Top_level test
       (
       .clk       (clk),       
       .rst       (rst),       
       .SW  (SW),       
       .cathode   (cathode),
       .anode     (anode)       
       );

/////////////////////////////////////////////////////////
// drive the clock
/////////////////////////////////////////////////////////
always #5 clk = ~clk;

/////////////////////////////////////////////////////////
// drive the inputs
/////////////////////////////////////////////////////////
initial begin
   clk = 0;
   rst = 1;
   SW = 16'h0000;
   SW = 4'b0;
   #100
   rst = 0;
   repeat (512)
      @(anode) SW = $random;
   $stop;
   end
   
always @(anode)
   begin
      #200
      case(anode)
         8'hFE: SW = SW[ 3: 0];
         8'hFD: SW = SW[ 7: 4];
         8'hFB: SW = SW[11: 8];
         8'hF7: SW = SW[15:12];
         8'hEF: SW = SW[ 3: 0];
         8'hDF: SW = SW[ 7: 4];
         8'hBF: SW = SW[11: 8];
         8'h7F: SW = SW[15:12];
         endcase
      
      $display("");   
      $display("Data In: %h Anode: %h Digit: %h",SW,anode,SW);
      case(SW[3:0])
         4'h0: if (cathode !== 8'hC0) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h1: if (cathode !== 8'hF9) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h2: if (cathode !== 8'hA4) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h3: if (cathode !== 8'hB0) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h4: if (cathode !== 8'h99) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h5: if (cathode !== 8'h92) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h6: if (cathode !== 8'h82) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h7: if (cathode !== 8'hF8) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h8: if (cathode !== 8'h80) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'h9: if (cathode !== 8'h90) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'hA: if (cathode !== 8'h88) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'hB: if (cathode !== 8'h83) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'hC: if (cathode !== 8'hC6) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'hD: if (cathode !== 8'hA1) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'hE: if (cathode !== 8'h86) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
         4'hF: if (cathode !== 8'h8E) $display("Error:   SW %h cathode %h anode %h ",SW,cathode,anode); else 
                                      $display("Correct: SW %h cathode %h anode %h",SW,cathode,anode);
      endcase
   end
      
endmodule

