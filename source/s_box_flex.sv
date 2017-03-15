// $Id: $
// File name:   s_box_large.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: 16 Parallel Rijndael S-Box 

module s_box_flex
#(
        parameter NUM_BYTES= 16
)
(
	input wire [NUM_BYTES*8-1:0]s_box_in,
	output reg [NUM_BYTES*8-1:0]s_box_out
);

genvar i;
generate
for (i = 0; i < NUM_BYTES ; i = i + 1) begin: make_subs
	s_box sub (.s_box_in(s_box_in[i*8+7:i*8]),.s_box_out(s_box_out[i*8+7:i*8]));
end
endgenerate


endmodule