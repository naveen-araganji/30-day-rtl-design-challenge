`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 05
// Module Name : half_adder_tb
// Description : Testbench for Half Adder
//////////////////////////////////////////////////////////////////////////////////

module half_adder_tb;
reg  i_a;
reg  i_b;
wire o_sum;
wire o_carry;
integer i;

// ---------- DUT Instantiation ----------
half_adder half_adder_inst (
    .i_a     (i_a),
    .i_b     (i_b),
    .o_sum   (o_sum),
    .o_carry (o_carry)
);

// ---------- Stimulus ----------
initial begin
    for (i=0; i<4; i=i+1) begin
        {i_a, i_b} = i; #10;
    end
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | o_sum=%b | o_carry=%b",
             $time, i_a, i_b, o_sum, o_carry);
end
    
endmodule