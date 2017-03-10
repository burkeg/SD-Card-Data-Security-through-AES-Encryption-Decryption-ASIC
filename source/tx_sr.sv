// $Id: $
// File name:   tx_s.sv
// Created:     2/22/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Transfer Shift Register
module tx_sr
(
	input clk,n_rst,falling_edge_found,tx_enable,load_data,
	input [7:0]tx_data,
	output tx_out
	
);
	
	flex_pts_sr #(8,1) sr (
		.clk(clk),
		.n_rst(n_rst),
		.shift_enable(falling_edge_found&tx_enable),
		.load_enable(load_data),
		.parallel_in(tx_data),
		.serial_out(tx_out)
	);


endmodule