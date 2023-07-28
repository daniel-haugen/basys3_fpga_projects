`timescale 1ns / 1ps

module testbench;

reg clk = 0;
wire [8:0] led;



// Unit under test (UUT)

ledBlinker uut (
    .clk(clk),
    .led(led)
    );
    

initial
begin
clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; clk = 1;
#10; clk = 0;
#10; $finish;

end


endmodule
