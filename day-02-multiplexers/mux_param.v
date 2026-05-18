`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_param
// Description : Parameterized 4:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module mux_param #(
    parameter WIDTH = 8
)(
    input [WIDTH-1:0] i_a,
    input [WIDTH-1:0] i_b,
    input [WIDTH-1:0] i_c,
    input [WIDTH-1:0] i_d,
    input [1:0] i_sel,
    output reg [WIDTH-1:0] o_y
);
always @(*) begin
    case (i_sel)
    2'b00: o_y = i_a;
    2'b01: o_y = i_b;
    2'b10: o_y = i_c;
    2'b11: o_y = i_d;
    endcase
end
    
endmodule