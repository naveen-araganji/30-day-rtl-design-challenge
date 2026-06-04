`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 17
// Module Name : debouncer_tb
// Description : Testbench for Debouncer
//////////////////////////////////////////////////////////////////////////////////

module debouncer_tb;
reg  i_clk;
reg  i_button;
wire o_button;

// ---------- DUT Instantiation ----------
debouncer dut (
    .i_clk    (i_clk),
    .i_button (i_button),
    .o_button (o_button)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    i_button = 1'b0; #10;

    // Simulated button bounce
    i_button = 1'b1; #10;
    i_button = 1'b0; #10;
    i_button = 1'b1; #10;
    i_button = 1'b0; #10;

    // Stable button press
    i_button = 1'b1; #50;
    i_button = 1'b1; #10;

    // Button release
    i_button = 1'b0; #20;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_button=%b | o_button=%b",
            $time, i_clk, i_button, o_button);
end
    
endmodule