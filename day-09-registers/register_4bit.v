`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 09
// Module Name : register_4bit
// Description : 4-bit Register
//////////////////////////////////////////////////////////////////////////////////

module register_4bit (
    input      [3:0] i_d,
    input            i_clk,
    output reg [3:0] o_q
);

always @(posedge i_clk) begin
    o_q <= i_d;
end
    
endmodule