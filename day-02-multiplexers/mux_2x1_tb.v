`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 02
// Module Name : mux_2x1_tb
// Description : Testbench for 2:1 Multiplexer
//////////////////////////////////////////////////////////////////////////////////

module mux_2x1_tb;
reg i_a;
reg i_b;
reg i_sel;

wire o_y;

integer i;

// ---------- DUT Instantiation ----------
mux_2x1 mux_2x1_inst(
    .i_a (i_a),
    .i_b (i_b),
    .i_sel (i_sel),
    .o_y (o_y)
);

// ---------- Stimulus ----------
initial begin
    for (i=0; i<8; i=i+1) begin
        {i_a,i_b,i_sel} = i;
        #10;
    end
    $finish;
end

// ---------- Monitor ----------
initial begin
    $monitor("Time=%0t | i_a=%b i_b=%b i_sel=%b | o_y=%b",
            $time, i_a, i_b, i_sel, o_y);
end

endmodule