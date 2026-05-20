`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 04
// Module Name : comparator_1bit_tb
// Description : Testbench for 1-bit Comparator
//////////////////////////////////////////////////////////////////////////////////

module comparator_1bit_tb;
reg  i_a;
reg  i_b;
wire o_gt;
wire o_eq;
wire o_lt;
integer i;

// ---------- DUT Instantiation ----------
comparator_1bit comparator_1bit_inst (
    .i_a  (i_a),
    .i_b  (i_b),
    .o_gt (o_gt),
    .o_eq (o_eq),
    .o_lt (o_lt)
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
    $monitor("Time=%0t | i_a=%b | i_b=%b | o_gt=%b | o_eq=%b | o_lt=%b",
            $time, i_a, i_b, o_gt, o_eq, o_lt);
end
    
endmodule