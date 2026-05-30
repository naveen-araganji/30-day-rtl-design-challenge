`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 14
// Module Name : clock_divider_by2
// Description : Divide-by-2 Clock Divider
//////////////////////////////////////////////////////////////////////////////////

module clock_divider_by2 (
    input i_clk,
    output reg o_clk_div
);

initial begin
    o_clk_div = 1'b0;
end

always @(posedge i_clk) begin
    o_clk_div = ~o_clk_div;
end
    
endmodule