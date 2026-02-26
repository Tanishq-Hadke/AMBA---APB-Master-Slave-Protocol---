`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2026 03:18:36 PM
// Design Name: 
// Module Name: apb_top
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


module apb_top(
    input wire CLK100MHZ,
    input wire btnC,
    output wire [15:0] led
);

wire PRESETn;
assign PRESETn = btnC;

wire PSEL, PENABLE, PWRITE;
wire [7:0] PADDR;
wire [31:0] PWDATA, PRDATA;
wire PREADY;
wire PSLVERR;

apb_master master(
    .PCLK(CLK100MHZ),
    .PRESETn(PRESETn),
    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY)
);

apb_slave slave(
    .PCLK(CLK100MHZ),
    .PRESETn(PRESETn),
    .PSEL(PSEL),
    .PENABLE(PENABLE),
    .PWRITE(PWRITE),
    .PADDR(PADDR),
    .PWDATA(PWDATA),
    .PRDATA(PRDATA),
    .PREADY(PREADY),
    .PSLVERR(PSLVERR),
    .led_out(led)
);

endmodule
