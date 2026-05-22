`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 06
// Module Name : adder_substractor_4bit_tb
// Description : Testbench for 4-bit Adder-Substractor
//////////////////////////////////////////////////////////////////////////////////

module adder_substractor_4bit_tb;
reg  [3:0] i_a;
reg  [3:0] i_b;
reg        i_mode;
wire [3:0] o_result;
wire       o_cout;

// ---------- DUT Instantiation ----------
adder_substractor_4bit dut (
    .i_a      (i_a),
    .i_b      (i_b),
    .i_mode   (i_mode),
    .o_result (o_result),
    .o_cout   (o_cout)
);

// ---------- Stimulus ----------
initial begin
    // Addition mode
    i_a = 4'b1010; i_b = 4'b0011; i_mode = 1'b0; #10;

    // Addition with carry
    i_a = 4'b1111; i_b = 4'b0001; i_mode = 1'b0; #10;

    // Substraction mode
    i_a = 4'b1010; i_b = 4'b0101; i_mode = 1'b1; #10;

    // Zero result
    i_a = 4'b1010; i_b = 4'b1010; i_mode = 1'b1; #10;

    // Boundary Substraction
    i_a = 4'b1111; i_b = 4'b0001; i_mode = 1'b1; #10;

    // Minimum Substraction
    i_a = 4'b0000; i_b = 4'b0001; i_mode = 1'b1; #10;

    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | i_mode=%b | o_result=%b | o_cout=%b",
            $time, i_a, i_b, i_mode, o_result, o_cout);
end
    
endmodule