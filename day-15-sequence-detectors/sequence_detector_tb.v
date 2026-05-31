`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 15
// Module Name : sequence_detector_tb
// Description : Testbench for Sequence Detector (101, 1101)
//////////////////////////////////////////////////////////////////////////////////

module sequence_detector_tb;
reg  i_clk;
reg  i_data;

wire o_detect_101;
wire o_detect_1101;

// ---------- DUT Instatiation ----------
sequence_detector_101 dut_101 (
    .i_clk        (i_clk),
    .i_data       (i_data),
    .o_detect_101 (o_detect_101)
);

sequence_detector_1101 dut_1101 (
    .i_clk         (i_clk),
    .i_data        (i_data),
    .o_detect_1101 (o_detect_1101)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    
    // Stream: 1101101
    i_data = 1'b1; #10;
    i_data = 1'b1; #10;
    i_data = 1'b0; #10;
    i_data = 1'b1; #10;
    i_data = 1'b1; #10;
    i_data = 1'b0; #10;
    i_data = 1'b1; #30;
    
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_data=%b | o_detect_101=%b | o_detect_1101",
            $time, i_clk, i_data, o_detect_101, o_detect_1101);
end
    
endmodule