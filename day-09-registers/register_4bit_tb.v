`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 09
// Module Name : register_4bit_tb
// Description : Testbench for 4-bit Register
//////////////////////////////////////////////////////////////////////////////////

module register_4bit_tb;
reg  [3:0] i_d;
reg        i_clk;
wire [3:0] o_q;

// ---------- DUT Instantiation ----------
register_4bit dut (
    .i_d   (i_d),
    .i_clk (i_clk),
    .o_q   (o_q)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    i_d = 4'b0000; #10;
    i_d = 4'b1010; #10;
    i_d = 4'b0101; #10;
    i_d = 4'b1111; #10;
    i_d = 4'b0011; #10
    
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_d=%b | o_q=%b",
            $time, i_clk, i_d, o_q);
end
    
endmodule