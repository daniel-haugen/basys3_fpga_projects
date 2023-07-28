`timescale 1ns / 1ps
`include "hvsync_generator.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/20/2023 09:16:30 PM
// Design Name: 
// Module Name: vga_test_signal
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


module vga_test_signal_top(clk, reset, counter, ntsc_clk);

input clk; // board clock: 100 MHz on Basys3 -- keeps all modules in sync
input reset;
output reg [3:0] counter;
output ntsc_clk;


always @(posedge clk or posedge reset)
if (reset)
    counter <= 0;
else 
    counter <= counter + 1;

assign ntsc_clk = counter[1]; // synonymous to a 4x clock divider -- leaving with a 25mhz pixel clock for ntsc resolution





endmodule
