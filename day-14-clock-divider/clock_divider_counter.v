`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 14
// Module Name : clock_divider_counter
// Description : Counter-based Clock divider
//////////////////////////////////////////////////////////////////////////////////

module clock_divider_counter (
    input i_clk,
    output reg o_clk_div
);

reg [1:0] count;

initial begin
    count = 2'b0;
    o_clk_div = 1'b0; 
end

always @(posedge i_clk) begin
    if (count == 2'b01) begin
        count <= 2'b00;
        o_clk_div <= ~o_clk_div;
    end
    else
        count <= count + 1'b1;
end
    
endmodule