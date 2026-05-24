`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : d_flipflop_tb
// Description : Testbench for D Flip-Flop
//////////////////////////////////////////////////////////////////////////////////

module d_flipflop_tb;
reg  i_d;
reg  i_clk;
wire o_q;

// ---------- DUT Instantiation ----------
d_flipflop dut (
    .i_d   (i_d),
    .i_clk (i_clk),
    .o_q   (o_q)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    i_d = 1'b0; #10;
    i_d = 1'b0; #10;
    i_d = 1'b1; #10;
    i_d = 1'b0; #10;
    i_d = 1'b1; #10;

    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_d=%b | o_q=%b",
            $time, i_clk, i_d, o_q);
end
    
endmodule