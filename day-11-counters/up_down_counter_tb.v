`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 11
// Module Name : up_down_counter_tb
// Description : Testbench for 4-bit Up/Down Counter
//////////////////////////////////////////////////////////////////////////////////

module up_down_counter_tb;
reg i_clk;
reg i_up_down;
wire [3:0] o_count;

// ---------- DUT Instantiation ----------
up_down_counter dut (
    .i_clk (i_clk),
    .i_up_down (i_up_down),
    .o_count (o_count)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk =1'b0;
    i_up_down = 1'b1; #50;
    i_up_down = 1'b0; #50;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_up_down=%b | o_count=%b",
            $time, i_clk, i_up_down, o_count);
end
    
endmodule