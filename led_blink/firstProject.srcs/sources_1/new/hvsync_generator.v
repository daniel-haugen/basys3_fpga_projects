`timescale 1ns / 1ps
`include "ntsc_pixel_clock.v"
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Daniel Haugen
// 
// Create Date: 07/20/2023 08:04:12 PM
// Design Name: 
// Module Name: hvsync_generator 
// Description: 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hvsync_generator(clk, reset, ntsc_clk, hsync, vsync, display_on, hpos, vpos);

input clk; // board clock: 100 MHz on Basys3 -- need it to keep all modules in sync
input reset;
input ntsc_clk;
output hsync, vsync;
output display_on;
output [8:0] hpos;
output [8:0] vpos;


localparam H_DISPLAY = 640; // horizontal display width
localparam H_BACK = 48; // left border
localparam H_FRONT = 16; // right border
localparam H_SYNC = 96;

localparam V_DISPLAY = 480; // vertical display height
localparam V_BOTTOM = 33; // vertical top border
localparam V_TOP = 10; // vertical bottom border
localparam V_SYNC = 2; //

localparam H_SYNC_START = H_DISPLAY + H_FRONT;
localparam H_SYNC_END = H_DISPLAY + H_FRONT + H_SYNC - 1;
localparam H_MAX = H_DISPLAY + H_BACK + H_FRONT + H_SYNC - 1;

localparam V_SYNC_START = V_DISPLAY + V_BOTTOM;
localparam V_SYNC_END = V_DISPLAY + V_BOTTOM + V_SYNC - 1;
localparam V_MAX = V_DISPLAY + V_TOP + V_BOTTOM + V_SYNC - 1;


always @(posedge ntsc_clk)
begin
    hsync <= (hpos>=H_SYNC_START && hpos<=H_SYNC_END) ;
    
    if (hmaxxed)
        hpos <= 0;
    else
        hpos <= hpos + 1;

end

wire hmaxxed = (hpos == h_MAX) || reset;
    





endmodule
