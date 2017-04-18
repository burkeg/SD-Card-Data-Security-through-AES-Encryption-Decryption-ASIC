// $Id: $
// File name:   inv_add_round_key.sv
// Created:     4/11/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Inverse Round Key Function

module inv_add_round_key
(
	input reg [127:0] data_in,
	input reg [127:0] data_store,
	input reg [127:0] key,
	input reg [3:0] count_in,
	output reg [127:0]data_out 
);

reg [127:0] in;

always_comb
begin
	if (count_in == 4'd0)
		in=data_in;
	else
		in=data_store;
end

assign data_out = in^key;

endmodule
