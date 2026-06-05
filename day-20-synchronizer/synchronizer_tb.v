`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 20
// Module Name : synchronizer_tb
// Description : Testbench for 2 flip-flop Synchronizer
//////////////////////////////////////////////////////////////////////////////////

module synchronizer_tb;
reg i_clk;
reg i_async_signal;

wire o_sync_signal;

// ---------- DUT Instantiation ----------
synchronizer dut (
    .i_clk (i_clk),
    .i_async_signal (i_async_signal),
    .o_sync_signal (o_sync_signal)
);

// ---------- Clock Generator ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    i_async_signal = 1'b0; #17;
    // Asynchronous transition
    i_async_signal = 1'b1; #23;
    // Another asynchronous transition
    i_async_signal = 1'b0; #18;
    // Another asynchronous transition
    i_async_signal = 1'b1; #27;
    // Another asynchronous transition
    i_async_signal = 1'b0; #20;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_async_signal=%b | o_sync_signal=%b",
            $time, i_clk, i_async_signal, o_sync_signal);
end
    
endmodule