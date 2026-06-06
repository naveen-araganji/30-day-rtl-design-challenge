`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Day         : 21
// Module Name : fixed_priority_arbiter
// Description : 4-Request Fixed Priority arbiter
//////////////////////////////////////////////////////////////////////////////////

module fixed_priority_arbiter (
    input      [3:0] i_request,
    output reg [3:0] o_grant
);

always @(*) begin
    if (i_request[0])
        o_grant = 4'b0001;
    else if (i_request[1])
        o_grant = 4'b0010;
    else if (i_request[2])
        o_grant = 4'b0100;
    else if (i_request[3])
        o_grant = 4'b1000;
    else
        o_grant = 4'b0000;
end
    
endmodule