// $Id: $
// File name:   keyscheduler.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Byte Substitution block
module keyscheduler
(
	input reg [127:0]key_in,
	input reg mode,
	input reg [3:0] enc_count_out,
	input reg [3:0] dec_count_out,
	output reg [127:0]curr_key 
);
reg [127:0] ext_key[10:0];

	gen_key keyyer (.data_in(key_in),.data_out(ext_key));

always_comb
begin
	if(mode)
		curr_key=ext_key[9-enc_count_out];
	else
		curr_key=ext_key[dec_count_out];
end



endmodule
