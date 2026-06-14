`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 29
// Module Name : rv32i_register_file
// Description : 32 x 32-bit RV32I Register File
//////////////////////////////////////////////////////////////////////////////////

module rv32i_register_file (
    input             i_clk,
    input             i_rst,
    input      [4:0]  i_rs1,
    input      [4:0]  i_rs2,
    input      [4:0]  i_rd,
    input             i_write_enable,
    input      [31:0] i_write_data,

    output     [31:0] o_rs1_data,
    output     [31:0] o_rs2_data
);

reg [31:0] reg_file [31:0];
integer i;

// ---------- Synchronous Write ----------
always @(posedge i_clk or posedge i_rst) begin

    if (i_rst) begin

        for (i = 0; i < 32; i = i + 1)
            reg_file[i] <= 32'd0;

    end
    else if (i_write_enable && (i_rd != 5'd0)) begin

        reg_file[i_rd] <= i_write_data;

    end

end

// ---------- Asynchronous Read ----------
assign o_rs1_data = (i_rs1 == 5'd0) ? 32'd0 : reg_file[i_rs1];
assign o_rs2_data = (i_rs2 == 5'd0) ? 32'd0 : reg_file[i_rs2];

endmodule