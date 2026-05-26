`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : sipo_shift_register
// Description : 4-bit Serial-In Parallel-out Shift Register
//////////////////////////////////////////////////////////////////////////////////

module sipo_shift_register (
    input        i_clk,
    input        i_serial_in,
    output [3:0] o_parallel_out
);

reg [3:0] shift_reg;

always @(posedge i_clk) begin
    shift_reg <= {shift_reg[2:0], i_serial_in};
end

assign o_parallel_out = shift_reg;
    
endmodule