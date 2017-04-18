// $Id: $
// File name:   inv_s_box_flex.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decyption S Box Flex 

module inv_s_box_flex
#(
        parameter NUM_BYTES= 16
)
(
	input wire [NUM_BYTES*8-1:0] inv_s_box_in,
	output reg [NUM_BYTES*8-1:0] inv_s_box_out
);

genvar i;
generate
for (i = 0; i < NUM_BYTES ; i = i + 1) begin: make_subs
	inv_s_box sub (.i_s_box_in(inv_s_box_in[i*8+7:i*8]),.i_s_box_out(inv_s_box_out[i*8+7:i*8]));
end
endgenerate


endmodule
