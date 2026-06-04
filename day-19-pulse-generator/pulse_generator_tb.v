`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 19
// Module Name : pulse_generator_tb
// Description : Testbench for Pulse Generator
//////////////////////////////////////////////////////////////////////////////////

module pulse_generator_tb;

reg  i_clk;
reg  i_signal;
wire o_pulse;

// ---------- DUT Instantiation ----------
pulse_generator dut (
    .i_clk    (i_clk),
    .i_signal (i_signal),
    .o_pulse  (o_pulse)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk    = 1'b0;
    i_signal = 1'b1; #20;

    // Rising Edge
    i_signal = 1'b1; #40;

    // Falling Edge
    i_signal = 1'b0; #20;

    // Rising Edge
    i_signal = 1'b1; #30;

    // Falling Edge
    i_signal = 1'b0; #20;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_clk=%b | i_signal=%b | o_pulse=%b",
             $time, i_clk, i_signal, o_pulse);
end

endmodule