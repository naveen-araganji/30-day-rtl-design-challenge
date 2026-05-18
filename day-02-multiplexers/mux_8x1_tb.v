`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_8x1_tb
// Description : Testbench for 8:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module mux_8x1_tb;
reg i_a;
reg i_b;
reg i_c;
reg i_d;
reg i_e;
reg i_f;
reg i_g;
reg i_h;
reg [2:0] i_sel;

wire o_y;

integer i;

// ---------- DUT Instantiation ----------
mux_8x1 dut (
  .i_a (i_a),
  .i_b (i_b),
  .i_c (i_c),
  .i_d (i_d),
  .i_e (i_e),
  .i_f (i_f),
  .i_g (i_g),
  .i_h (i_h),
  .i_sel (i_sel),
  .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
  i_a = 1'b0;
  i_b = 1'b1;
  i_c = 1'b0;
  i_d = 1'b1;
  i_e = 1'b0;
  i_f = 1'b1;
  i_g = 1'b0;
  i_h = 1'b1;

  for (i = 0; i < 8; i = i+1) begin
     i_sel = i;
     #10;
  end
  $finish;
end

// ---------- Monitor ----------
initial begin
  $monitor("Time=%0t | i_sel=%b | o_y=%b",
           $time, i_sel, o_y);
end

endmodule