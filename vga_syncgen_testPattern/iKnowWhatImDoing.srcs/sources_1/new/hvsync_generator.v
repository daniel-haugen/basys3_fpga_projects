`timescale 1ns / 1ps
`ifndef HVSYNC_GENERATOR_H
`define HVSYNC_GENERATOR_H

module hvsync_generator(px_clk, hsync, vsync, display_on, x, y);


input px_clk;
output reg hsync = 0; 
output reg vsync = 0;
output display_on;
output reg [11:0] x = 0;
output reg [11:0] y = 0;


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

wire hmaxxed = (x == H_MAX);	// set when x is max
wire vmaxxed = (y == V_MAX);    // set when y is max

always @(posedge px_clk)
begin
    hsync <= (x>=H_SYNC_START && x<=H_SYNC_END);
    if (hmaxxed)
        x <= 0;
    else
        x <= x + 1;
end

always @(posedge px_clk)
begin
    vsync <= (y>=V_SYNC_START && y <=V_SYNC_END);
    if(hmaxxed)
        if (vmaxxed)
            y <= 0;
        else
            y <= y + 1;
end

// display_on is set when beam is in "safe" visible frame
assign display_on = (x<H_DISPLAY) && (y<V_DISPLAY);
endmodule

`endif