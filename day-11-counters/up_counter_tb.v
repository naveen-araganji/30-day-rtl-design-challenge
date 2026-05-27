`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 11
// Module Name : up_counter_tb
// Description : Test bench for 4-bit Up Counter
//////////////////////////////////////////////////////////////////////////////////

module up_counter_tb;
reg        i_clk;
wire [3:0] o_count;

// ---------- DUT Instantiation ----------
up_counter dut (
    .i_clk   (i_clk),
    .o_count (o_count)
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
    $monitor ("Time=%0t | i_clk=%b | o_count=%b",
            $time, i_clk, o_count);
end

endmodule