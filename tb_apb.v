`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2026 03:19:20 PM
// Design Name: 
// Module Name: tb_apb
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
module tb_apb();

reg clk;
reg rst;

wire [15:0] led;

apb_top DUT(
    .CLK100MHZ(clk),
    .btnC(rst),
    .led(led)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 100MHz
end

initial begin
    rst = 0;
    #20;
    rst = 1;
    #500;
    $stop;
end

endmodule
