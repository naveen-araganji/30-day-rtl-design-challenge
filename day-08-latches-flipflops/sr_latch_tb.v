`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 08
// Module Name : sr_latch_tb
// Description : Testbench for SR Latch
//////////////////////////////////////////////////////////////////////////////////

module sr_latch_tb;
reg  i_s;
reg  i_r;
wire o_q;
wire o_qbar;

// ---------- DUT Instantiation ----------
sr_latch dut (
    .i_s    (i_s),
    .i_r    (i_r),
    .o_q    (o_q),
    .o_qbar (o_qbar)
);

// ---------- Stimulus ----------
initial begin
    
    // Hold (initial)
    i_s = 1'b0; i_r = 1'b0; #10;

    // set
    i_s = 1'b1; i_r = 1'b0; #10;

    // Hold after set
    i_s = 1'b0; i_r = 1'b0; #10;

    // Reset
    i_s = 1'b0; i_r = 1'b1; #10;

    // Hold after reset
    i_s = 1'b0; i_r = 1'b0; #10;

    // Invalid state
    i_s = 1'b1; i_r = 1'b1; #10;
    
    // Return to hold
    i_s = 1'b0; i_r = 1'b0; #10;
    
    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_s=%b | i_r=%b | o_q=%b | o_qbar=%b",
            $time, i_s, i_r, o_q, o_qbar);
end
    
endmodule