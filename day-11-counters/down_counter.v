`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 11
// Module Name : down_counter
// Description : 4-bit Down Counte
//////////////////////////////////////////////////////////////////////////////////

module down_counter (
    input            i_clk,
    output reg [3:0] o_count
);

initial
    o_count = 4'b1111;

always @(posedge i_clk) begin
    o_count <= o_count - 4'b0001;
end

endmodule