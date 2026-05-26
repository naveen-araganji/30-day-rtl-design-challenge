`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 07
// Module Name : alu_4bit
// Description : 4-bit Arithmetic Logic Unit
//////////////////////////////////////////////////////////////////////////////////

module alu_4bit (
    input      [3:0] i_a,
    input      [3:0] i_b,
    input      [2:0] i_opcode,
    output reg [3:0] o_result,
    output reg       o_cout
);

always @(*) begin
    
    case (i_opcode)

    // Addition
    3'b000: begin
        {o_cout, o_result} = i_a + i_b;
    end

    // Subtraction
    3'b001: begin
        {o_cout, o_result} = i_a - i_b;
    end

    // AND
    3'b010: begin
        o_result = i_a & i_b;
    end

    // OR
    3'b011: begin
        o_result = i_a | i_b;
    end

    // EXOR
    3'b100: begin
        o_result = i_a ^ i_b;
    end

    // Shift Left
    3'b101: begin
        o_result = i_a << 1;
    end

    // Shift Right
    3'b110: begin
        o_result = i_a >> 1;
    end

    default: begin
        o_result = 4'b0000;
        o_cout   = 1'b0;
    end

    endcase
end
    
endmodule