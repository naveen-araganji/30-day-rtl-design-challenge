`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 04
// Module Name : comparator_1bit
// Description : 1-bit Comparator
//////////////////////////////////////////////////////////////////////////////////

module comparator_1bit (
    input  i_a,
    input  i_b,
    output o_gt,
    output o_eq,
    output o_lt
);
assign o_gt = i_a & ~i_b;
assign o_eq = ~(i_a ^ i_b);
assign o_lt = ~i_a & i_b;
    
endmodule