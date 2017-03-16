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
	input reg [3:0] count_out,
	output reg [127:0]curr_key 
);
reg [127:0] ext_key[10:0];

	gen_key keyyer (.data_in(key_in),.data_out(ext_key));

always_comb
begin
	curr_key=ext_key[9-count_out];
end



endmodule
