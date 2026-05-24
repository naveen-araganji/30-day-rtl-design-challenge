`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : t_flipflop
// Description : Testbench for T Flip-Flop
//////////////////////////////////////////////////////////////////////////////////

module t_flipflop_tb;
reg  i_t;
reg  i_clk;
wire o_q;

// ---------- DUT Instantiation ----------
t_flipflop dut (
    .i_t   (i_t),
    .i_clk (i_clk),
    .o_q   (o_q)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    // Hold
    i_t = 1'b0; #10;

    // Toggle
    i_t = 1'b1; #10;

    // Toggle again
    i_t = 1'b1; #10;

    // Hold
    i_t = 1'b0; #10;

    // Toggle
    i_t = 1'b1; #10;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_t=%b | o_q=%b",
            $time, i_clk, i_t, o_q);
end
    
endmodule