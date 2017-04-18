// $Id: $
// File name:   inv_byte_sub.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decryption Byte Substitution

module inv_byte_sub
(
	input reg [127:0]data_in,
	input reg [3:0] count_out,
	input reg [127:0] key,
	output reg [127:0]data_out 
);

reg [127:0] data;

	inv_s_box_flex flexer (.inv_s_box_in(data_in),.inv_s_box_out(data));

always_comb
begin
	if (count_out == 4'd9)
		data_out=key^data;
	else
		data_out=data;
end

endmodule
