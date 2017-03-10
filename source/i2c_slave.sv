// $Id: $
// File name:   i2c_slave.sv
// Created:     2/22/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Slave Top level block
module i2c_slave
(
	input wire clk,
	input wire n_rst,
	input wire scl,
	input wire sda_in,
	output wire sda_out,
	input reg write_enable,
	input reg [7:0]write_data,
	output reg fifo_empty,
	output reg fifo_full
);

reg rw_mode;
reg address_match;
reg start_found;
reg stop_found;
reg byte_received;
reg ack_prep;
reg check_ack;
reg ack_done;
reg rx_enable;
reg rising_edge_found;
reg falling_edge_found;
reg tx_enable;
reg load_data;
reg read_enable;
reg tx_out;
reg [7:0]rx_data;
reg [7:0]read_data;
reg [1:0]sda_mode;
	
	controller controller_(
		.clk(clk),
		.n_rst(n_rst),
		.stop_found(stop_found),
		.start_found(start_found),
		.byte_received(byte_received),
		.ack_prep(ack_prep),
		.check_ack(check_ack),
		.ack_done(ack_done),
		.rw_mode(rw_mode),
		.address_match(address_match),
		.sda_in(sda_in),
		.rx_enable(rx_enable),
		.tx_enable(tx_enable),
		.read_enable(read_enable),
		.sda_mode(sda_mode),
		.load_data(load_data)
	);

	timer timer_(
		.clk(clk),
		.n_rst(n_rst),
		.falling_edge_found(falling_edge_found),
		.rising_edge_found(rising_edge_found),
		.stop_found(stop_found),
		.start_found(start_found),
		.byte_received(byte_received),
		.ack_prep(ack_prep),
		.check_ack(check_ack),
		.ack_done(ack_done)
	);

	tx_fifo tx_fifo_(
		.clk(clk),
		.n_rst(n_rst),
		.read_enable(read_enable),
		.read_data(read_data),
		.fifo_empty(fifo_empty),
		.fifo_full(fifo_full),
		.write_enable(write_enable),
		.write_data(write_data)		
	); 
	
	tx_sr tx_s_ (
		.clk(clk),
		.n_rst(n_rst),
		.tx_out(tx_out),
		.falling_edge_found(falling_edge_found),
		.tx_enable(tx_enable),
		.tx_data(read_data),
		.load_data(load_data)
	); 

	rx_sr rx_s_ (
		.clk(clk),
		.n_rst(n_rst),
		.sda_in(sda_in),
		.rising_edge_found(rising_edge_found),
		.rx_enable(rx_enable),
		.rx_data(rx_data)
	); 
	
	decode decode_ (
		.clk(clk),
		.n_rst(n_rst),
		.sda_in(sda_in),
		.scl(scl),
		.starting_byte(rx_data),
		.rw_mode(rw_mode),
		.address_match(address_match),
		.stop_found(stop_found),
		.start_found(start_found)
	); 

	sda_sel sda_sel_ (
		.tx_out(tx_out),	
		.sda_mode(sda_mode),	
		.sda_out(sda_out)
	);

	scl_edge scl_edge_ (
		.clk(clk),	
		.n_rst(n_rst),	
		.scl(scl),	
		.rising_edge_found(rising_edge_found),	
		.falling_edge_found(falling_edge_found)
	); 



endmodule

