`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : jk_flipflop
// Description : Positive Edge Triggered JK Flip-Flop
//////////////////////////////////////////////////////////////////////////////////

module jk_flipflop (
    input      i_j,
    input      i_k,
    input      i_clk,
    output reg o_q
);

always @(posedge i_clk) begin
    case ({i_j, i_k})
    2'b00: o_q <= o_q;  // Hold
    2'b01: o_q <= 1'b0; // Reset
    2'b10: o_q <= 1'b1; // Set
    2'b11: o_q <= ~o_q; // Toggle
    endcase
end
    
endmodule