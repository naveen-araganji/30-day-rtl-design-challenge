`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 06
// Module Name : full_substractor_tb
// Description : Testbench for Full Substractor
//////////////////////////////////////////////////////////////////////////////////

module full_substractor_tb;
reg  i_a;
reg  i_b;
reg  i_bin;
wire o_diff;
wire o_bout;
integer i;

// ---------- DUT Instantiation ----------
full_substractor dut (
    .i_a    (i_a),
    .i_b    (i_b),
    .i_bin  (i_bin),
    .o_diff (o_diff),
    .o_bout (o_bout)
);

// ---------- Stimulus ----------
initial begin
    for (i=0; i<8; i=i+1) begin
        {i_a, i_b, i_bin} = i;
        #10;
    end
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | i_bin=%b | o_diff=%b | o_bout=%b",
            $time, i_a, i_b, i_bin, o_diff, o_bout);
end
    
endmodule