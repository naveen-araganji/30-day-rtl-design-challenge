`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 09
// Module Name : register_load enable
// Description : 4-bit Register with Load Enable
//////////////////////////////////////////////////////////////////////////////////

module register_load_enable (
    input            i_clk,
    input            i_load_enable,
    input      [3:0] i_d,
    output reg [3:0] o_q
);

always @(posedge i_clk) begin
    if (i_load_enable)
        o_q <= i_d;
    else
        o_q <= o_q;
end
    
endmodule