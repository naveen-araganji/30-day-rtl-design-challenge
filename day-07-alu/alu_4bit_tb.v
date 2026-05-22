`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 07
// Module Name : alu_4bit_tb
// Description : Testbench for 4-bit Arithmetic Logic Unit
//////////////////////////////////////////////////////////////////////////////////

module alu_4bit_tb;
reg  [3:0] i_a;
reg  [3:0] i_b;
reg  [2:0] i_opcode;
wire [3:0] o_result;
wire       o_cout;

// ---------- DUT Instantiation ----------
alu_4bit dut (
    .i_a      (i_a),
    .i_b      (i_b),
    .i_opcode (i_opcode),
    .o_result (o_result),
    .o_cout   (o_cout)
);

// ---------- Stimulus ----------
initial begin
    // ADD
    i_a = 4'b1010; i_b = 4'b0001; i_opcode = 3'b000; #10;

    // ADD with carry
    i_a = 4'b1111; i_b = 4'b0001; i_opcode = 3'b000; #10;

    // SUB
    i_a = 4'b0101; i_b = 4'b0010; i_opcode = 3'b001; #10;

    // SUB negative - result
    i_a = 4'b0010; i_b = 4'b0101; i_opcode = 3'b001; #10;

    // AND
    i_a = 4'b1010; i_b = 4'b1001; i_opcode = 3'b010; #10;

    // OR
    i_a = 4'b0101; i_b = 4'b1010; i_opcode = 3'b011; #10;

    // EXOR
    i_a = 4'b0010; i_b = 4'b1010; i_opcode = 3'b100; #10;

    // Shift Left
    i_a = 4'b0011; i_b = 4'b0000; i_opcode = 3'b101; #10;

    // Shift Right
    i_a = 4'b1100; i_b = 4'b0000; i_opcode = 3'b110; #10;

    // Default case
    i_a = 4'b1010; i_b = 4'b0001; i_opcode = 3'b111; #10;

    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | i_b=%b | i_opcode=%b | o_result=%b | o_cout=%b",
            $time, i_a, i_b, i_opcode, o_result, o_cout);
end
    
endmodule