`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 01
// Module Name : logic_gates_tb
// Description : Testbench for basic logic gates
//////////////////////////////////////////////////////////////////////////////////

module logic_gates_tb;
reg i_a;
reg i_b;

wire o_not;
wire o_and;
wire o_or;
wire o_nand;
wire o_nor;
wire o_exor;
wire o_exnor;

// ---------- DUT Instantiation ----------
not_gate not_gate_inst(
    .i_a (i_a),
    .o_y (o_not)
);

and_gate and_gate_inst(
    .i_a (i_a),
    .i_b (i_b),
    .o_y (o_and)
);

or_gate or_gate_inst(
    .i_a (i_a),
    .i_b (i_b),
    .o_y (o_or)
);

nand_gate nand_gate_inst(
    .i_a (i_a),
    .i_b (i_b),
    .o_y (o_nand)
);

nor_gate nor_gate_inst(
    .i_a (i_a),
    .i_b (i_b),
    .o_y (o_nor)
);

exor_gate exor_gate_inst(
    .i_a (i_a),
    .i_b (i_b),
    .o_y (o_exor)
);

exnor_gate exnor_gate_inst(
    .i_a (i_a),
    .i_b (i_b),
    .o_y (o_exnor)
);

// ---------- Test cases ----------
initial begin
    i_a = 1'b0; i_b = 1'b0; #10;
    i_a = 1'b0; i_b = 1'b1; #10;
    i_a = 1'b1; i_b = 1'b0; #10;
    i_a = 1'b1; i_b = 1'b1; #10;
    $finish;
end

endmodule