// $Id: $
// File name:   add_round_key.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Add Round Key Module
module add_round_key
(
	input reg [127:0] data_in,
	input reg [127:0] key,
	output reg [127:0]data_out 
);

assign data_out=key^data_in;
	

endmodule


