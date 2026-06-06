`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 21
// Module Name : fixed_priority_arbiter_tb
// Description : Testbench for 4-Request Fixed Priority Arbiter
//////////////////////////////////////////////////////////////////////////////////

module fixed_priority_arbiter_tb;
reg  [3:0] i_request;
wire [3:0] o_grant;
integer i;

// ---------- DUT Instantiation ----------
fixed_priority_arbiter dut (
    .i_request (i_request),
    .o_grant   (o_grant)
);

// ---------- Stimulus ----------
initial begin
    for (i = 0; i < 16; i = i + 1)begin
        i_request = i; #10;
    end
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor ("Time=%0t | i_request=%b | o_grant=%b",
            $time, i_request, o_grant);
end
    
endmodule