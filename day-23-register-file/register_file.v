`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 23
// Module Name : register_file
// Description : 4x8 Register File with 1 Write port and 2 Read ports
//////////////////////////////////////////////////////////////////////////////////

module register_file (
    input i_clk,
    input i_wr_en,
    input [1:0] i_wr_addr,
    input [7:0] i_wr_data,
    input [1:0] i_rd_addr1,
    input [1:0] i_rd_addr2,
    output [7:0] o_rd_data1,
    output [7:0] o_rd_data2
);

reg [7:0] reg_file [0:3];

integer i;

initial begin
    for (i = 0; i < 4; i = i + 1) begin
        reg_file[i] = 8'd0;
    end
end

// ---------- Write Operation ----------
always @(posedge i_clk) begin
    if (i_wr_en)
        reg_file[i_wr_addr] <= i_wr_data;
end

// ---------- Read Operation ----------
assign o_rd_data1 = reg_file[i_rd_addr1];
assign o_rd_data2 = reg_file[i_rd_addr2];
    
endmodule