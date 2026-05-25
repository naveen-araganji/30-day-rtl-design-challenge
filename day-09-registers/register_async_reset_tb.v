`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 09
// Module Name : register_async_reset_tb
// Description : Testbench for 4-bit Register with Asynchronous Reset
//////////////////////////////////////////////////////////////////////////////////

module register_async_reset_tb;
reg        i_clk;
reg        i_reset;
reg  [3:0] i_d;
wire [3:0] o_q;

// ---------- DUT Instantiation ----------
register_async_reset dut (
    .i_clk   (i_clk),
    .i_reset (i_reset),
    .i_d     (i_d),
    .o_q     (o_q)
);

// ---------- Clock Generator ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    // Apply reset
    i_reset = 1'b1; i_d = 4'b0001; #7;

    // Release reset
    i_reset = 1'b0; #8;

    // Load data
    i_d = 4'b0001; #7;

    // Async reset in between clock edges
    i_reset = 1'b1; #3;

    // Release reset
    i_reset = 1'b0; i_d = 4'b0110; #7;

    // Load final value
    i_d = 4'b0001; #7;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_reset=%b | i_d=%b | o_q=%b",
            $time, i_clk, i_reset, i_d, o_q);
end
    
endmodule