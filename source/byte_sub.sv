// $Id: $
// File name:   byte_sub.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Byte Substitution block
module byte_sub
(
	input reg [127:0]data_in,
	input reg [3:0] count_out,
	input reg [127:0]data_to_store,
	input reg [127:0] key,
	output reg [127:0]data_out 
);
reg [127:0] in;

	s_box_flex flexer (.s_box_in(in),.s_box_out(data_out));

always_comb
begin
	if (count_data == 4'd0)
		in=data_in^key;
	else
		in=data_to_store;
end



endmodule
