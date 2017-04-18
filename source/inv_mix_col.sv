// $Id: $
// File name:   inv_mix_col.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decyption Mix Column
module inv_mix_col
(
	input reg [127:0]data_in,
	input reg [3:0] count_out,
	output reg [127:0]data_out 
);
reg [127:0] out;

genvar i;
generate
for (i = 0; i < 4 ; i = i + 1) begin: inv_col_mixer
	inv_mix_col_sub subparts (.data_in(data_in[i*32+31:i*32]),.data_out(out[i*32+31:i*32]));
end
endgenerate

always_comb
begin
	if (count_out == 4'd0)
		data_out=data_in;
	else
		data_out=out;
end

endmodule
