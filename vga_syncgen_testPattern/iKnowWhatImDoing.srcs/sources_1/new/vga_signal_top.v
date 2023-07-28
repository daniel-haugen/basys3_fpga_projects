`timescale 1ns / 1ps
`include "hvsync_generator.v"

module vga_signal_top(clk, hsync, vsync, vgaRed, vgaGreen, vgaBlue);

input clk;
output hsync, vsync;
output reg [3:0] vgaRed, vgaGreen, vgaBlue;

wire [11:0] x;
wire [11:0] y;
wire display_on;
reg [35:0] counter = 0;
wire px_clk;
assign px_clk = counter[1];

always @(posedge clk)
counter <= counter + 1;

hvsync_generator hvsync_gen (
    .px_clk(px_clk),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(display_on),
    .x(x),
    .y(y)
);

wire r = display_on & (((x&7)==0) | ((y&7)==0));
wire g = display_on & x[5];
wire b = display_on & y[6];

always @(posedge clk) begin
    if (display_on & r)
        vgaRed <= 15;
        else
        vgaRed <=0;
    if (display_on && g)
        vgaGreen <= 15;
        else
        vgaGreen <= 0;
    if (display_on && b)
        vgaBlue <= 15;
        else
        vgaBlue <= 0;
end


endmodule
