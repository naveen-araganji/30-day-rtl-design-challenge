`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : d_latch
// Description : D Latch (Level-sensitive)
//////////////////////////////////////////////////////////////////////////////////

module d_latch (
    input      i_d,
    input      i_en,
    output reg o_q
);
always @(*) begin
    if (i_en)
        o_q = i_d;
end
    
endmodule