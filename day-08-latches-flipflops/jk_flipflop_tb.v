`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : jk_flipflop_tb
// Description : Testbench for JK Flip-Flop
//////////////////////////////////////////////////////////////////////////////////

module jk_flipflop_tb;
reg  i_j;
reg  i_k;
reg  i_clk;
wire o_q;

// ---------- DUT Instantiation ----------
jk_flipflop dut (
    .i_j   (i_j),
    .i_k   (i_k),
    .i_clk (i_clk),
    .o_q   (o_q)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    // Hold
    i_j = 1'b0; i_k = 1'b0; #10;

    // Rest
    i_j = 1'b0; i_k = 1'b1; #10;

    // Set
    i_j = 1'b1; i_k = 1'b0; #10;

    // Toggle
    i_j = 1'b1; i_k = 1'b1; #10;

    // Toggle again
    i_j = 1'b1; i_k = 1'b1; #10;

    // Hold
    i_j = 1'b0; i_k = 1'b0; #10;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_j=%b | i_k=%b | i_q=%b",
            $time, i_clk, i_j, i_k, o_q);
end
    
endmodule