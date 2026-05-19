`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 03
// Module Name : encoder_4x2
// Description : 4:2 Encoder
//////////////////////////////////////////////////////////////////////////////////

module encoder_4x2 (
    input [3:0] i_a,
    output reg [1:0] o_y
);
always @(*) begin
    case (i_a)
    4'b0001: o_y = 2'b00;
    4'b0010: o_y = 2'b01;
    4'b0100: o_y = 2'b10;
    4'b1000: o_y = 2'b11;
    default: o_y = 2'b00;
    endcase
end
    
endmodule