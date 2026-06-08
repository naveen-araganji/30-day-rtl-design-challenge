`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 22
// Module Name : fifo
// Description : 4x8 Synchronous Fifo
//////////////////////////////////////////////////////////////////////////////////

module fifo (
    input            i_clk,
    input            i_wr_en,
    input            i_rd_en,
    input      [7:0] i_data,
    output reg [7:0] o_data,
    output           o_full,
    output           o_empty
);

reg [7:0] mem [0:3];

reg [1:0] wr_ptr;
reg [1:0] rd_ptr;
reg [2:0] count;

initial begin
    wr_ptr = 2'b00;
    rd_ptr = 2'b00;
    count = 3'b000;
    o_data = 8'b00000000;
end


always @(posedge i_clk) begin

    // Write Operation
    if (i_wr_en && !o_full)begin
        mem[wr_ptr] <= i_data;
        wr_ptr <= wr_ptr + 1'b1;
    end

    // Read Operation
    if (i_rd_en && !o_empty) begin
        o_data <= mem[rd_ptr];
        rd_ptr <= rd_ptr + 1'b1;
    end
    
    // ---------- Count Tracking ----------
    case ({i_wr_en && !o_full, i_rd_en && !o_empty})
        2'b10 : count <= count + 1'b1; // Write Only
        2'b01 : count <= count - 1'b1; // Read Only
        2'b11 : count <= count;        // Simultaneous Read & Write
        default : count <= count;      // No Operation
        endcase
end

assign o_full = (count == 4);
assign o_empty = (count == 0);
    
endmodule