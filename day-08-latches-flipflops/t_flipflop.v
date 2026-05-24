`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : t_flipflop
// Description : Positive Edge Triggered T Flip-Flop
//////////////////////////////////////////////////////////////////////////////////

module t_flipflop (
    input      i_t,
    input      i_clk,
    output reg o_q
);
initial
o_q = 1'b0;

always @(posedge i_clk) begin
    if (i_t)
    o_q <= ~o_q; // Toggle
    else
    o_q <= o_q;   // Hold
end
    
endmodule