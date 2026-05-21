`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 05
// Module Name : half_adder
// Description : Half Adder
//////////////////////////////////////////////////////////////////////////////////

module half_adder (
    input  i_a,
    input  i_b,
    output o_sum,
    output o_carry
);

assign o_sum   = i_a ^ i_b;
assign o_carry = i_a & i_b;
    
endmodule