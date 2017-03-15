// $Id: $
// File name:   operationG.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: G Operation used in keyschedule 
module operationG
(
	input reg [31:0]data_in,
	input reg [31:0]rcon,
	output reg [31:0]data_out
);

reg [31:0]intermed;


	s_box_flex #(4) s4 (
		.s_box_in({data_in[23:0],data_in[31:24]}),
		.s_box_out(intermed));

always_comb
begin
	data_out=intermed^rcon;
end

endmodule
