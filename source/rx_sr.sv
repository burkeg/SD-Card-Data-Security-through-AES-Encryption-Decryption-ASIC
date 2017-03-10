// $Id: $
// File name:   rx_sr.sv
// Created:     2/22/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Reciever Shift Register
module rx_sr
(
	input clk, n_rst, sda_in, rising_edge_found,rx_enable,
	output [7:0]rx_data
	
);
	
	flex_stp_sr #(8,1) sr (.clk(clk),.n_rst(n_rst),.shift_enable(rx_enable&rising_edge_found),.serial_in(sda_in),.parallel_out(rx_data));
endmodule

	