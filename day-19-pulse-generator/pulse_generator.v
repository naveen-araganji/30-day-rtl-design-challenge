`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 19
// Module Name : pulse_generator
// Description : Single Clock Pulse Generator
//////////////////////////////////////////////////////////////////////////////////

module pulse_generator (
    input      i_clk,
    input      i_signal,
    output reg o_pulse

);

reg prev_signal;

initial begin
    prev_signal = 1'b0;
    o_pulse     = 1'b0;
end

always @(posedge i_clk) begin

    if (~prev_signal && i_signal)
        o_pulse <= 1'b1;
    else
        o_pulse <= 1'b0;

    prev_signal <= i_signal;

end
endmodule