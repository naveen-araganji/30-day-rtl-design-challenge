`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 03
// Module Name : decoder_2x4
// Description : 2:4 Decoder
//////////////////////////////////////////////////////////////////////////////////

module decoder_2x4 (
    input [1:0] i_a,
    output reg [3:0] o_y
);
always @(*) begin
    case (i_a)
    2'b00: o_y = 4'b0001;
    2'b01: o_y = 4'b0010;
    2'b10: o_y = 4'b0100;
    2'b11: o_y = 4'b1000;
    endcase
end
    
endmodule