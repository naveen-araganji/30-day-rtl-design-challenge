`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 13
// Module Name : johnson_counter
// Description : 4-bit Johnson Counter
//////////////////////////////////////////////////////////////////////////////////

module johnson_counter (
    input i_clk,
    output reg [3:0] o_count
);

initial
    o_count = 4'b0000;

always @(posedge i_clk) begin
    o_count <= {~o_count[0], o_count[3:1]};
end

endmodule