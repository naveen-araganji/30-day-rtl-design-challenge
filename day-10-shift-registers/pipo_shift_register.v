`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : pipo_shift_registe
// Description : 4-bit Parallel-In Paralle-Out Register
//////////////////////////////////////////////////////////////////////////////////

module pipo_shift_register (
    input        i_clk,
    input  [3:0] i_parallel_in,
    output [3:0] o_parallel_out
);

reg [3:0] shift_register;

always @(posedge i_clk) begin
    shift_register <= i_parallel_in;
end

assign o_parallel_out = shift_register;
    
endmodule