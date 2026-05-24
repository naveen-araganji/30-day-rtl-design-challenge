`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : d_flipflop
// Description : Positive Edge Triggered D Flip-Flop
//////////////////////////////////////////////////////////////////////////////////

module d_flipflop (
    input      i_d,
    input      i_clk,
    output reg o_q
);

always @(posedge i_clk) begin
    o_q <= i_d;
end
    
endmodule