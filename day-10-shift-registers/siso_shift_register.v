`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : siso_shift_register
// Description : 4-bit Serial-In Serial-Out Shift Register
//////////////////////////////////////////////////////////////////////////////////

module siso_shift_register (
    input i_clk,
    input i_serial_in,
    output o_serial_out
);

reg [3:0] shift_register;

always @(posedge i_clk) begin
    shift_register <= {shift_register[2:0], i_serial_in};
end

assign o_serial_out = shift_register [3];
    
endmodule