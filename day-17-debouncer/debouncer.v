`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 17
// Module Name : debouncer
// Description : Simple Counter-based Debouncer
//////////////////////////////////////////////////////////////////////////////////

module debouncer (
    input i_clk,
    input i_button,
    output reg o_button
);

reg [1:0] count;

initial begin
    count = 2'b0;
    o_button = 1'b0;
end

always @(posedge i_clk) begin
    if (i_button) begin
        if (count < 2'b11)
            count <= count + 1'b1;
        else
            o_button <= 1'b1;
    end
    else begin
        count <= 2'b00;
        o_button <= 1'b0;
    end
end
    
endmodule