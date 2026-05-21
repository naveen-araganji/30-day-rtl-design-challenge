`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 05
// Module Name : ripple_carry_adder_4bit
// Description : 4-bit Ripple Carry Adder using Full Adders
//////////////////////////////////////////////////////////////////////////////////

module ripple_carry_adder_4bit (
    input [3:0]  i_a,
    input [3:0]  i_b,
    input        i_cin,
    output [3:0] o_sum,
    output       o_carry
);

wire w_carry1;
wire w_carry2;
wire w_carry3;

// ---------- Full Adder1 ----------
full_adder fa0 (
    .i_a     (i_a[0]),
    .i_b     (i_b[0]),
    .i_cin   (i_cin),
    .o_sum   (o_sum[0]),
    .o_carry (w_carry1)
);

// ---------- Full Adder2 ----------
full_adder fa1 (
    .i_a     (i_a[1]),
    .i_b     (i_b[1]),
    .i_cin   (w_carry1),
    .o_sum   (o_sum[1]),
    .o_carry (w_carry2)
);

// ---------- Full Adder1 ----------
full_adder fa2 (
    .i_a     (i_a[2]),
    .i_b     (i_b[2]),
    .i_cin   (w_carry2),
    .o_sum   (o_sum[2]),
    .o_carry (w_carry3)
);

// ---------- Full Adder1 ----------
full_adder fa3 (
    .i_a     (i_a[3]),
    .i_b     (i_b[3]),
    .i_cin   (w_carry3),
    .o_sum   (o_sum[3]),
    .o_carry (o_carry)
);

endmodule