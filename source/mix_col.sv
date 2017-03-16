// $Id: $
// File name:   mix_col.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Mix Columns Module.
module mix_col
(
	input reg [127:0]data_in,
	output reg [127:0]data_out 
);


genvar i;
generate
for (i = 0; i < 4 ; i = i + 1) begin: col_mixer
	mix_col_sub subparts (.data_in(data_in[i*32+31:i*32]),.data_out(data_out[i*32+31:i*32]));
end
endgenerate
endmodule


