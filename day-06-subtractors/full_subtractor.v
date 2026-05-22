`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 06
// Module Name : full_substractor
// Description : Full Substractor using two Half Substractors
//////////////////////////////////////////////////////////////////////////////////

module full_substractor (
    input  i_a,
    input  i_b,
    input  i_bin,
    output o_diff,
    output o_bout
);
wire w_diff;
wire w_bout1;
wire w_bout2;

// ---------- Half Substractor1 ----------
half_substractor hs1 (
    .i_a      (i_a),
    .i_b      (i_b),
    .o_diff   (w_diff),
    .o_borrow (w_bout1)
);

// ---------- Half Substractor2 ----------
half_substractor hs2 (
    .i_a      (w_diff),
    .i_b      (i_bin),
    .o_diff   (o_diff),
    .o_borrow (w_bout2)
);

// ---------- Borrow Output ----------
assign o_bout = w_bout1 | w_bout2;
    
endmodule