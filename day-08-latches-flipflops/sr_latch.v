`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : sr_latch
// Description : SR Latch using NOR gates
//////////////////////////////////////////////////////////////////////////////////

module sr_latch (
    input  i_s,
    input  i_r,
    output o_q,
    output o_qbar
);

assign o_q    = ~(i_r | o_qbar);
assign o_qbar = ~(i_s | o_q);
    
endmodule