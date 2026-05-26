`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : pipo_shift_register_tb
// Description : Testbench for 4-bit PIPO Register
//////////////////////////////////////////////////////////////////////////////////

module pipo_shift_register_tb;
reg        i_clk;
reg  [3:0] i_parallel_in;
wire [3:0] o_parallel_out;

// ---------- DUT Instantiation ----------
pipo_shift_register dut (
    .i_clk          (i_clk),
    .i_parallel_in  (i_parallel_in),
    .o_parallel_out (o_parallel_out)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk =1'b0;

    i_parallel_in = 4'b1010; #10;
    i_parallel_in = 4'b0101; #10;
    i_parallel_in = 4'b1111; #10;
    i_parallel_in = 4'b0110; #10;

    $finish;
    
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_parallel_in=%b | o_parallel_out=%b",
            $time, i_clk, i_parallel_in, o_parallel_out);
end
    
endmodule