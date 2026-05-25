`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 09
// Module Name : register_load_enable_tb 
// Description : Testbench for 4-bit register with Load Enable
//////////////////////////////////////////////////////////////////////////////////

module register_load_enable_tb;
reg        i_clk;
reg        i_load_enable;
reg  [3:0] i_d;
wire [3:0] o_q;

// ---------- DUT Instantiation ----------
register_load_enable dut (
    .i_clk         (i_clk),
    .i_load_enable (i_load_enable),
    .i_d           (i_d),
    .o_q           (o_q)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;

    // Load Data
    i_load_enable = 1'b1; i_d = 4'b1010; #10

    // Hold previous value
    i_load_enable = 1'b0; i_d = 4'b1000; #10

    // Load New Data
    i_load_enable = 1'b1; i_d = 4'b1111; #10

    // Hold again
    i_load_enable = 1'b0; i_d = 4'b1010; #10

    // Load final value
    i_load_enable = 1'b1; i_d = 4'b0101; #10

    $finish;

end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_clk=%b | i_load_enable=%b | i_d=%b | o_q=%b",
            $time, i_clk, i_load_enable, i_d, o_q);
end
    
endmodule