`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 03
// Module Name : priority_encoder_tb
// Description : Testbench for 4:2 Priority Encoder
//////////////////////////////////////////////////////////////////////////////////

module priority_encoder_tb;
reg [3:0] i_a;
wire [1:0] o_y;

// ---------- DUT Instantiation ----------
priority_encoder priority_encoder_inst(
    .i_a (i_a),
    .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
    // Single active inputs
    i_a = 4'b0001; #10;
    i_a = 4'b0010; #10;
    i_a = 4'b0100; #10;
    i_a = 4'b1000; #10;

    // Multiple active inputs (Priority check)
    i_a = 4'b1111; #10;
    i_a = 4'b0110; #10;
    i_a = 4'b0011; #10;
    i_a = 4'b1100; #10

    // No active input
    i_a = 4'b0000; #10;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | o_y=%b", $time, i_a, o_y);
end

endmodule