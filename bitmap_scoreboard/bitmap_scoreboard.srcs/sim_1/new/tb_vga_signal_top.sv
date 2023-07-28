`timescale 1ns / 1ps

module tb_vga_signal_top;

reg clk;
wire hsync, vsync;
wire [3:0] vgaRed;
wire [3:0] vgaGreen;
wire [3:0] vgaBlue;
wire [11:0] x, y;

localparam CLK_PERIOD = 10;

vga_signal_top tester (
    .clk(clk),
    .hsync(hsync),
    .vsync(vsync),
    .vgaRed(vgaRed),
    .vgaGreen(vgaGreen),
    .vgaBlue(vgaBlue),
    .x(x),
    .y(y)
);


initial clk = 0;
always #(CLK_PERIOD / 2.0) begin
   clk = ~clk;
end


endmodule
