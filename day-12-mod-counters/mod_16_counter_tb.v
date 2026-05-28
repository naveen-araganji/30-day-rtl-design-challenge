`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 12
// Module Name : mod_16_counter_tb
// Description : Testbench for Mod-16 Counter
//////////////////////////////////////////////////////////////////////////////////

module mod_16_counter_tb;
reg i_clk;
wire [3:0] o_count;

// ---------- DUT Instantiation ----------
mod_16_counter dut (
    .i_clk (i_clk),
    .o_count (o_count)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    #180;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | o_count=%b",
            $time, i_clk, o_count);
end
    
endmodule