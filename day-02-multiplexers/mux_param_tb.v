`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_param_tb
// Description : Testbench for Parameterized 4:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////
module mux_param_tb;

parameter WIDTH = 8;

reg  [WIDTH-1:0] i_a;
reg  [WIDTH-1:0] i_b;
reg  [WIDTH-1:0] i_c;
reg  [WIDTH-1:0] i_d;
reg  [1:0]       i_sel;
wire [WIDTH-1:0] o_y;

// ---------- DUT Instantiation ----------
mux_param #(
  .WIDTH (WIDTH)
) dut (
  .i_a (i_a),
  .i_b (i_b),
  .i_c (i_c),
  .i_d (i_d),
  .i_sel (i_sel),
  .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
  i_a = 8'h11;
  i_b = 8'h22;
  i_c = 8'h33;
  i_d = 8'h44;

  i_sel = 2'b00; #10;
  i_sel = 2'b01; #10;
  i_sel = 2'b10; #10;
  i_sel = 2'b11; #10;

  $finish;
end

// ---------- Monitor ----------
initial begin
  $monitor("Time=%0t | i_sel=%b | o_y=%h",
           $time, i_sel, o_y);
end

endmodule