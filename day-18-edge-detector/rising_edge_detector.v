`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 18
// Module Name : rising_edge_detector
// Description : Rising Edge Detector
//////////////////////////////////////////////////////////////////////////////////

module rising_edge_detector (

    input        i_clk,
    input        i_signal,

    output reg   o_edge

);

    reg prev_signal;

    initial begin
        prev_signal = 1'b0;
        o_edge      = 1'b0;
    end

    always @(posedge i_clk) begin

        if (~prev_signal && i_signal)
            o_edge <= 1'b1;
        else
            o_edge <= 1'b0;

        prev_signal <= i_signal;

    end

endmodule