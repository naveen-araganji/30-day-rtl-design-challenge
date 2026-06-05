`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 20
// Module Name : synchronizer
// Description : 2 flip-flop Synchronizer
//////////////////////////////////////////////////////////////////////////////////

module synchronizer (
    input i_clk,
    input i_async_signal,
    output reg o_sync_signal
);

reg ff1;

initial begin
    ff1 = 1'b0;
    o_sync_signal = 1'b0;
end

always @(posedge i_clk) begin
    ff1 <= i_async_signal;
    o_sync_signal <= ff1;
end
    
endmodule