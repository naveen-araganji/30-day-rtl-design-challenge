`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 06
// Module Name : adder_substractor_4bit
// Description : 4-bit Adder-Substractor
//////////////////////////////////////////////////////////////////////////////////

module adder_substractor_4bit (
    input  [3:0] i_a,
    input  [3:0] i_b,
    input        i_mode,
    output [3:0] o_result,
    output       o_cout
);
wire [3:0] w_b;
wire       c1;
wire       c2;
wire       c3;

// ---------- Conditional B inversion ----------
assign w_b = i_b ^ {4{i_mode}};

// ---------- Full adder1 ----------
full_adder fa1 (
    .i_a     (i_a[0]),
    .i_b     (w_b[0]),
    .i_cin   (i_mode),
    .o_sum   (o_result[0]),
    .o_carry (c1)
);

// ---------- Full adder2 ----------
full_adder fa2 (
    .i_a     (i_a[1]),
    .i_b     (w_b[1]),
    .i_cin   (c1),
    .o_sum   (o_result[1]),
    .o_carry (c2)
);

// ---------- Full adder3 ----------
full_adder fa3 (
    .i_a     (i_a[2]),
    .i_b     (w_b[2]),
    .i_cin   (c2),
    .o_sum   (o_result[2]),
    .o_carry (c3)
);

// ---------- Full adder4 ----------
full_adder fa4 (
    .i_a     (i_a[3]),
    .i_b     (w_b[3]),
    .i_cin   (c3),
    .o_sum   (o_result[3]),
    .o_carry (o_cout)
);
    
endmodule