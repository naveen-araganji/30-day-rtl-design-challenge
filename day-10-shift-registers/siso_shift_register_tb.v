`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : siso_shift_register_tb
// Description : Testbench for 4-bit SISO Shift Register
//////////////////////////////////////////////////////////////////////////////////

module siso_shift_register_tb;
reg  i_clk;
reg  i_serial_in;
wire o_serial_out;

// ---------- DUT Instantiation ----------
siso_shift_register dut (
    .i_clk        (i_clk),
    .i_serial_in  (i_serial_in),
    .o_serial_out (o_serial_out)
);

// ---------- Clock Generator ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

      // Serial input sequence: 1 0 1 1
      i_serial_in = 1'b1; #10;
      i_serial_in = 1'b0; #10;
      i_serial_in = 1'b1; #10;
      i_serial_in = 1'b1; #10;

      // Extra clocks to shift data out
      i_serial_in = 1'b0; #10;
      i_serial_in = 1'b0; #10;
      i_serial_in = 1'b0; #10;
      i_serial_in = 1'b0; #10;
    
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_serial_in=%b | o_serial_out=%b",
            $time, i_clk, i_serial_in, o_serial_out);
end
    
endmodule