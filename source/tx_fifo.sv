// $Id: $
// File name:   tx_fifo.sv
// Created:     2/20/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Transmitting FIFO Wrapper
module tx_fifo
(
	input wire clk,
	input wire n_rst,
	input wire read_enable,
	input wire write_enable,
	input wire [7:0]write_data,
	output reg [7:0]read_data,
	output reg fifo_empty,
	output reg fifo_full
);
	
	fifo fifo_ (.r_clk(clk),.w_clk(clk),.n_rst(n_rst),.r_enable(read_enable),.w_enable(write_enable),.w_data(write_data),.r_data(read_data),.empty(fifo_empty),.full(fifo_full));
	


endmodule