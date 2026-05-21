`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 05
// Module Name : ripple_carry_adder_4bit_tb
// Description : Testbench for 4-bit Ripple Carry Adder
//////////////////////////////////////////////////////////////////////////////////

module ripple_carry_adder_4bit_tb;
reg [3:0]  i_a;
reg [3:0]  i_b;
reg        i_cin;
wire [3:0] o_sum;
wire       o_carry;

// ---------- DUT Instantiation ----------
ripple_carry_adder_4bit dut (
    .i_a     (i_a),
    .i_b     (i_b),
    .i_cin   (i_cin),
    .o_sum   (o_sum),
    .o_carry (o_carry)
);

// ---------- Stimulus ----------
initial begin
    // Zero addition
    i_a = 4'b0000; i_b = 4'b0000; i_cin = 1'b0; #10;

    // Normal addition
    i_a = 4'b1010; i_b = 4'b0011; i_cin = 1'b0; #10;

    // Carry generation
    i_a = 4'b1111; i_b = 4'b0001; i_cin = 1'b0; #10;

    // Carry-in effect
    i_a = 4'b0101; i_b = 4'b0011; i_cin = 1'b1; #10;

    // Maximum addition
    i_a = 4'b1111; i_b = 4'b1111; i_cin = 1'b0; #10;

    // Zero addition
    i_a = 4'b0001; i_b = 4'b1111; i_cin = 1'b0; #10;
    
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | i_cin=%b | o_sum=%b | o_carry=%b",
            $time, i_a, i_b, i_cin, o_sum, o_carry);
end 
    
endmodule