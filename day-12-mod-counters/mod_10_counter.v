`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 12
// Module Name : mod_10_counter
// Description : Mod-10 Counter
//////////////////////////////////////////////////////////////////////////////////

module mod_10_counter (
    input            i_clk,
    output reg [3:0] o_count
);

initial
    o_count = 1'b0;

always @(posedge i_clk) begin
    if (o_count == 4'b1001)
        o_count <= 4'b0000;
    else
        o_count <= o_count + 4'b0001;
end

endmodule