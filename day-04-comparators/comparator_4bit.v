`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 04
// Module Name : comparator_4bit
// Description : 4-bit Comparator
//////////////////////////////////////////////////////////////////////////////////

module comparator_4bit (
    input [3:0] i_a,
    input [3:0] i_b,
    output      o_gt,
    output      o_eq,
    output      o_lt
);
assign o_gt = i_a > i_b;
assign o_eq = i_a == i_b;
assign o_lt = i_a < i_b;
    
endmodule