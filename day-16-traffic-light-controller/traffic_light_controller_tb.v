`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 16
// Module Name : traffic_light_controller_tb
// Description : Testbench for Traffic Light Controller
//////////////////////////////////////////////////////////////////////////////////

module traffic_light_controller_tb;
reg  i_clk;
wire o_red;
wire o_yellow;
wire o_green;

// ---------- DUT Instantiation ----------
traffic_light_controller dut (
    .i_clk    (i_clk),
    .o_red    (o_red),
    .o_yellow (o_yellow),
    .o_green  (o_green)
);

// ---------- Clock Generation ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    #100;
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_clk=%b | o_red=%b | o_yellow=%b | o_green=%b",
            $time, i_clk, o_red, o_yellow, o_green);
end
    
endmodule