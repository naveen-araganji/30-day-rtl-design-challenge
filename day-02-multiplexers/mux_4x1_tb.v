`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_4x1_tb
// Description : Testbench for 4:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module mux_4x1_tb;
reg i_a;
reg i_b;
reg i_c;
reg i_d;
reg [1:0] i_sel;

wire o_y;

integer i;

// ---------- DUT Instantiation ----------
mux_4x1 dut (
  .i_a (i_a),
  .i_b (i_b),
  .i_c (i_c),
  .i_d (i_d),
  .i_sel (i_sel),
  .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
  for (i = 0; i < 64; i = i + 1) begin
     {i_a, i_b, i_c, i_d, i_sel} = i;
     #10;
  end
  $finish;
end

// ---------- Monitor ----------
initial begin
  $monitor("Time=%0t | i_sel=%b | i_a=%b i_b=%b i_c=%b i_d=%b | o_y=%b",
           $time, i_sel, i_a, i_b, i_c, i_d, o_y);
end

endmodule