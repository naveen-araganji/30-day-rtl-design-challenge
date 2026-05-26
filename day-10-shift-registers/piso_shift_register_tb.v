`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 10
// Module Name : piso_shift_register_tb
// Description : Testbench for 4-bit PISO Register
//////////////////////////////////////////////////////////////////////////////////

module piso_shift_register_tb;
reg       i_clk;
reg       i_load;
reg [3:0] i_parallel_in;
wire      o_serial_out;

// ---------- DUT Instantiation ----------
piso_shift_register dut (
    .i_clk         (i_clk),
    .i_load        (i_load),
    .i_parallel_in (i_parallel_in),
    .o_serial_out  (o_serial_out)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulsu ----------
initial begin
    i_clk = 1'b0;

    // Load parallel data
    i_load = 1'b1;
    i_parallel_in = 4'b1011;
    #10;

    // Shift data out
    i_load = 0;
    #10;
    #10;
    #10;
    #10;

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_load=%b | i_parallel_in=%b",
            $time, i_clk, i_load, i_load, i_parallel_in);
end
    
endmodule