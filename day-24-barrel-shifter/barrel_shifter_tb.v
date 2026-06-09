`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 24
// Module Name : barrel_shifter_tb
// Description : Testbench for 8-bit Logical Barrel Shifter
//////////////////////////////////////////////////////////////////////////////////

module barrel_shifter_tb;
reg  [7:0] i_data;
reg  [2:0] i_shift_amt;
reg        i_dir;
wire [7:0] o_data;

// ---------- DUT Instantiation ----------
barrel_shifter dut (
    .i_data      (i_data),
    .i_shift_amt (i_shift_amt),
    .i_dir       (i_dir),
    .o_data      (o_data)
);

// ---------- Stimulus ----------
initial begin
    // Left shift
    i_data = 8'b00001111;
    i_dir = 1'b0;
    i_shift_amt = 3'd0; #10;
    i_shift_amt = 3'd1; #10;
    i_shift_amt = 3'd2; #10;
    i_shift_amt = 3'd3; #10;

    // Right Shift
    i_data = 8'b11110000;
    i_dir = 1'b1;
    i_shift_amt = 3'd0; #10;
    i_shift_amt = 3'd1; #10;
    i_shift_amt = 3'd2; #10;
    i_shift_amt = 3'd3; #10;
    i_shift_amt = 3'd4; #10;
    $finish;
end

// ---------- MOnitor ----------
initial begin
    $monitor ("Time=%0t | i_dir=%b | i_data=%b | i_shif_amt=%d | o_data=%b",
            $time, i_dir, i_data, i_shift_amt, o_data);
end
    
endmodule