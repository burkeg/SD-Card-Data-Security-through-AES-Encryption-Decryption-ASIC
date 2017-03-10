// $Id: $
// File name:   timer.sv
// Created:     2/22/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Timer Block
module timer 
(
	input wire clk,
	input wire n_rst,
	input wire rising_edge_found,
	input wire falling_edge_found,
	input wire stop_found,
	input wire start_found,
	output reg byte_received,
	output reg ack_prep,
	output reg check_ack,
	output reg ack_done
);
	
reg [3:0]cnt;
reg byte_received_;
reg ack_prep_;
reg check_ack_;
reg ack_done_;
	

flex_counter cnter(
	.clk(clk),
	.n_rst(n_rst),
	.clear(stop_found|start_found),
	.count_enable(rising_edge_found),
	.rollover_val(4'd9),
	.count_out(cnt),
	.rollover_flag()
);

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
	begin
		byte_received<=0;
		ack_prep<=0;
		check_ack<=0;
		ack_done<=0;
	end
	else
	begin
		byte_received<=byte_received_;
		ack_prep<=ack_prep_;
		check_ack<=check_ack_;
		ack_done<=ack_done_;
	end
end

always_comb
begin
	byte_received_=(cnt==4'd7)&rising_edge_found;
	ack_prep_=(cnt==4'd8)&falling_edge_found;
	check_ack_=(cnt==4'd8)&rising_edge_found;
	ack_done_=(cnt==4'd9)&falling_edge_found;
end
endmodule
















