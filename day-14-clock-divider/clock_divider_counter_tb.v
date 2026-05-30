`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 14
// Module Name : clock_divider_counter_tb
// Description : Testbench for Counter-based Clock divider
//////////////////////////////////////////////////////////////////////////////////

module clock_divider_counter_tb;
reg i_clk;
wire o_clk_div;

// ---------- DUT Instantiation ----------
clock_divider_counter dut (
    .i_clk (i_clk),
    .o_clk_div (o_clk_div)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    #100;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | o_clk_div=%b",
            $time, i_clk, o_clk_div);
end
    
endmodule