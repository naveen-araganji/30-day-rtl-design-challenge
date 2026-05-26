`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : sipo_shift_register
// Description : Testbench for 4-bit SIPO Register
//////////////////////////////////////////////////////////////////////////////////

module sipo_shift_register_tb;
reg        i_clk;
reg        i_serial_in;
wire [3:0] o_parallel_out;

// ---------- DUT Instantiation ----------
sipo_shift_register dut (
    .i_clk          (i_clk),
    .i_serial_in    (i_serial_in),
    .o_parallel_out (o_parallel_out)
);

// ---------- Clock Generator ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    // Serial input sequence: 1101
    i_serial_in = 1'b1; #10;
    i_serial_in = 1'b1; #10;
    i_serial_in = 1'b0; #10;
    i_serial_in = 1'b1; #10;

    // Additional shifts
    i_serial_in = 1'b0; #10;
    i_serial_in = 1'b0; #10;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_serial_in=%b | o_parallel_out=%b",
            $time, i_clk, i_serial_in, o_parallel_out);
end

endmodule