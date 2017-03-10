// $Id: $
// File name:   sda_sel.sv
// Created:     2/20/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: SDA Output Selection Block
module sda_sel
(
	input wire tx_out,
	input wire[1:0] sda_mode,
	output reg sda_out
);

always_comb
begin
	sda_out=1;
	if (sda_mode == 2'b00)
		sda_out=1'b1;
	else if (sda_mode == 2'b01)
		sda_out=1'b0;
	else if (sda_mode == 2'b10)
		sda_out=1'b1;
	else if (sda_mode == 2'b11)
		sda_out=tx_out;
end


endmodule