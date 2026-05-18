`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_8x1
// Description : 8:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module mux_8x1 (
    input i_a,
    input i_b,
    input i_c,
    input i_d,
    input i_e,
    input i_f,
    input i_g,
    input i_h,
    input [2:0] i_sel,
    output reg o_y
);
always @ (*) begin
    case (i_sel)
    3'b000: o_y = i_a;
    3'b001: o_y = i_b;
    3'b010: o_y = i_c;
    3'b011: o_y = i_d;
    3'b100: o_y = i_e;
    3'b101: o_y = i_f;
    3'b110: o_y = i_g;
    3'b111: o_y = i_h;
    endcase
end
    
endmodule