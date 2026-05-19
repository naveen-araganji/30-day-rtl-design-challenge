`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 03
// Module Name : decoder_2x4_tb
// Description : Testbench for 2:4 Decoder
//////////////////////////////////////////////////////////////////////////////////

module decoder_2x4_tb;
reg [1:0] i_a;
wire [3:0] o_y;
integer i;

// ---------- DUT Instantiation ----------
decoder_2x4 decoder_2x4_inst (
    .i_a (i_a),
    .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
    for (i=0; i<4; i=i+1)begin
        i_a = i;
        #10;
    end
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b | o_y=%b", $time, i_a, o_y);
end
    
endmodule