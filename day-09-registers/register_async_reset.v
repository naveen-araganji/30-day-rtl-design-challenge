`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 09
// Module Name : register_async_reset
// Description : 4-bit Register with Asynchronous Reset
//////////////////////////////////////////////////////////////////////////////////

module register_async_reset (
    input            i_clk,
    input            i_reset,
    input      [3:0] i_d,
    output reg [3:0] o_q
);

always @(posedge i_clk or posedge i_reset) begin
    if (i_reset)
        o_q <= 4'b0000;
    else
        o_q <= i_d;
end
    
endmodule