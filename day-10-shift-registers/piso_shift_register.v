`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : piso_shift_register
// Description : 4-bit Parallel-In Serial-Out Shift Register
//////////////////////////////////////////////////////////////////////////////////

module piso_shift_register (
    input       i_clk,
    input       i_load,
    input [3:0] i_parallel_in,
    output      o_serial_out
);

reg [3:0] shift_register;

always @(posedge i_clk) begin
    if (i_load)
        shift_register <= i_parallel_in;
    else
        shift_register <= {shift_register[2:0], 1'b0};
end

assign o_serial_out = shift_register[3];
    
endmodule