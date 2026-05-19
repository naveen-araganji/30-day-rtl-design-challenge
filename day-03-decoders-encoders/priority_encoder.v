`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 03
// Module Name : priority_encoder
// Description : 4:2 Priority Encoder
//////////////////////////////////////////////////////////////////////////////////

module priority_encoder (
    input [3:0] i_a,
    output reg [1:0] o_y
);
always @(*) begin
    if      (i_a[3]) o_y = 2'b11;
    else if (i_a[2]) o_y = 2'b10;
    else if (i_a[1]) o_y = 2'b01;
    else if (i_a[0]) o_y = 2'b00;
    else             o_y = 2'b00;
end
    
endmodule