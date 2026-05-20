`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 04
// Module Name : comparator_4bit_tb
// Description : Testbench for 4-bit comparator
//////////////////////////////////////////////////////////////////////////////////

module comparator_4bit_tb;
reg [3:0] i_a;
reg [3:0] i_b;
wire      o_gt;
wire      o_eq;
wire      o_lt;


// ---------- DUT Instantiation ----------
comparator_4bit comparator_4bit_inst (
    .i_a  (i_a),
    .i_b  (i_b),
    .o_gt (o_gt),
    .o_eq (o_eq),
    .o_lt (o_lt)
);

// ---------- Stimulus ----------
initial begin
    // Greater than cases
    i_a = 4'b1010; i_b = 4'b0110; #10;
    i_a = 4'b1111; i_b = 4'b0001; #10;

    // Equal cases
    i_a = 4'b0000; i_b = 4'b0000; #10;
    i_a = 4'b0101; i_b = 4'b0101; #10;

    // Lesser than cases
    i_a = 4'b0010; i_b = 4'b0100; #10;
    i_a = 4'b1000; i_b = 4'b0000; #10;

    // Boundary cases
    i_a = 4'b1111; i_b = 4'b0000; #10;
    i_a = 4'b0000; i_b = 4'b0000; #10;
    i_a = 4'b0000; i_b = 4'b1111; #10;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | o_gt=%b | o_eq=%b | o_lt=%b",
             $time, i_a, i_b, o_gt, o_eq, o_lt);
end
    
endmodule