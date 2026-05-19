`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 03
// Module Name : encoder_4x2_tb
// Description : Testbench for 4:2 Encoder
//////////////////////////////////////////////////////////////////////////////////

module encoder_4x2_tb;
reg [3:0] i_a;
wire [1:0] o_y;
integer i;

// ---------- DUT Instantiation ----------
encoder_4x2 encoder_4x2_inst(
    .i_a (i_a),
    .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
    // Valid one-hot test cases
    i_a = 4'b0001; #10;
    i_a = 4'b0010; #10;
    i_a = 4'b0100; #10;
    i_a = 4'b1000; #10;

    // Invalid case
    i_a = 4'b0011; #10;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b  | o_y=%b", $time, i_a, o_y);
end

endmodule