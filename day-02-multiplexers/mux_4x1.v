`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_4x1
// Description : 4:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module mux_4x1 (
    input i_a,
    input i_b,
    input i_c,
    input i_d,
    input [1:0] i_sel,
    output o_y
);
assign o_y = (i_sel == 2'b00)? i_a:
             (i_sel == 2'b01)? i_b:
             (i_sel == 2'b10)? i_c:
                               i_d;

endmodule