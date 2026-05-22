`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 06
// Module Name : half_substractor
// Description : Half Substractor
//////////////////////////////////////////////////////////////////////////////////

module half_substractor (
    input  i_a,
    input  i_b,
    output o_diff,
    output o_borrow
);
assign o_diff   = i_a ^ i_b;
assign o_borrow = ~i_a & i_b;
    
endmodule