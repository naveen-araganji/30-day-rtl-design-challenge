`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 18
// Module Name : edge_detector_tb
// Description : Testbench for Edge Detectors
//////////////////////////////////////////////////////////////////////////////////

module edge_detector_tb;

reg  i_clk;
reg  i_signal;

wire o_rising_edge;
wire o_falling_edge;
wire o_both_edge;

// ---------- DUT Instantiation ----------
rising_edge_detector dut_rising (
    .i_clk    (i_clk),
    .i_signal (i_signal),
    .o_edge   (o_rising_edge)
);

falling_edge_detector dut_falling (
    .i_clk    (i_clk),
    .i_signal (i_signal),
    .o_edge   (o_falling_edge)
);

both_edge_detector dut_both (
    .i_clk    (i_clk),
    .i_signal (i_signal),
    .o_edge   (o_both_edge)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin

    i_clk    = 1'b0;
    i_signal = 1'b0; #20;

    // Rising Edge
    i_signal = 1'b1; #20;

    // Falling Edge
    i_signal = 1'b0; #20;

    // Rising Edge
    i_signal = 1'b1; #20;

    // Falling Edge
    i_signal = 1'b0; #20;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_clk=%b | i_signal=%b | rising=%b | falling=%b | both=%b",
             $time, i_clk, i_signal, o_rising_edge, o_falling_edge, o_both_edge);
end

endmodule
    
