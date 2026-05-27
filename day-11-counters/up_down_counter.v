`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 11
// Module Name : up_down_counter
// Description : 4-bit Up/Down Counter
//////////////////////////////////////////////////////////////////////////////////

module up_down_counter (
    input i_clk,
    input i_up_down,
    output reg [3:0] o_count
);

initial
    o_count = 4'b0000;

always @(posedge i_clk) begin
    if (i_up_down)
        o_count <= o_count + 4'b0001;
    else
        o_count <= o_count - 4'b0001;
end

endmodule