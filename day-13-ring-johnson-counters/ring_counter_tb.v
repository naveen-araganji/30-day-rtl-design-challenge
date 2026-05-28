`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 13
// Module Name : ring_counter_tb
// Description : Testbench for 4-bit Ring Counter
//////////////////////////////////////////////////////////////////////////////////

module ring_counter_tb;
reg i_clk;
wire [3:0] o_count;

// ---------- DUT Instantiation ----------
ring_counter dut (
    .i_clk (i_clk),
    .o_count (o_count)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    #80;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | o_count=%b",
            $time, i_clk, o_count);
end
    
endmodule