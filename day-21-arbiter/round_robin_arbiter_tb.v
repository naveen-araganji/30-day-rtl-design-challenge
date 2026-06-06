`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 21
// Module Name : round_robin_arbiter_tb
// Description : Testbench for 4-Request Round Robin Arbiter
//////////////////////////////////////////////////////////////////////////////////

module round_robin_arbiter_tb;
reg        i_clk;
reg  [3:0] i_request;
wire [3:0] o_grant;

// ---------- DUT Instantiation ----------
round_robin_arbiter dut (
    .i_clk     (i_clk),
    .i_request (i_request),
    .o_grant   (o_grant)
);

// ---------- Clock Generator ----------
always #5 i_clk = ~i_clk;

// ---------- Stimulus ----------
initial begin
    i_clk = 1'b0;
    i_request = 4'b0000;

    // All requester active
    i_request = 4'b1111; #50;

    // Requesters 1 and 3 active
    i_request = 4'b1010; #50;

    // Requesters 0 and 2 active
    i_request = 4'b0101; #20;

    // Only requester 2 active
    i_request = 4'b0100; #20;

    // No requester active
    i_request = 4'b0000; #10;

    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_request=%b | o_grant=%b",
            $time, i_request, o_grant);
end
    
endmodule