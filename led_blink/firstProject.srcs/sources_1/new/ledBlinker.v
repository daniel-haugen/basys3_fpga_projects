

module ledBlinker(clk, led);

input clk;
output reg [8:0] led = 0;
reg [24:0] count = 0;
 
 
always @(posedge clk) 
begin
    count <= count + 1;
    led <= count[24:16]; 
end

endmodule