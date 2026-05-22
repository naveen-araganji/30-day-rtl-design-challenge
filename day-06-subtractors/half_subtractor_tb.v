`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 06
// Module Name : half_substractor_tb
// Description : Testbench for Half Substractor
//////////////////////////////////////////////////////////////////////////////////

module half_substractor_tb;
reg i_a;
reg i_b;
wire o_diff;
wire o_borrow;
integer i;

// ---------- DUT Instantiation ----------
half_substractor dut (
    .i_a (i_a),
    .i_b (i_b),
    .o_diff (o_diff),
    .o_borrow (o_borrow)
);

// ---------- Stimulus ----------
initial begin
    for (i=0; i<4; i=i+1) begin
        {i_a, i_b} = i;
        #10;
    end
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | o_diff=%b | o_borrow=%b",
            $time, i_a, i_b, o_diff, o_borrow);
end
    
endmodule