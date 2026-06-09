`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 24
// Module Name : barrel_shifter
// Description : 8-bit Logical Barrel Shifter
//////////////////////////////////////////////////////////////////////////////////

module barrel_shifter (
    input      [7:0] i_data,
    input      [2:0] i_shift_amt,
    input            i_dir,
    output reg [7:0] o_data
);

always @(*) begin
    case (i_dir)
    // Left Shift
    1'b0: o_data = i_data << i_shift_amt;
    // Right Shift
    1'b1: o_data = i_data >> i_shift_amt;
    default: o_data = 8'd0;
    endcase
end
    
endmodule