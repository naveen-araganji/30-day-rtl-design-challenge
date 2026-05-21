`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 05
// Module Name : full_adder
// Description : Full adder using two Half Adders
//////////////////////////////////////////////////////////////////////////////////

module full_adder (
    input  i_a,
    input  i_b,
    input  i_cin,
    output o_sum,
    output o_carry
);
wire w_sum;
wire w_carry1;
wire w_carry2;

// ---------- Half Adder1 ----------
half_adder ha1 (
    .i_a     (i_a),
    .i_b     (i_b),
    .o_sum   (w_sum),
    .o_carry (w_carry1)
);

// ---------- Half Adder2 ----------
half_adder ha2 (
    .i_a     (w_sum),
    .i_b     (i_cin),
    .o_sum   (o_sum),
    .o_carry (w_carry2)
);

// ---------- Carry Output ----------
assign o_carry = w_carry1 | w_carry2;
    
endmodule