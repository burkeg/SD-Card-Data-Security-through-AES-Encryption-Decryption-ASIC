// $Id: $
// File name:   decode.sv
// Created:     2/20/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode Block
module decode
(
	input wire clk,
	input wire n_rst,
	input wire scl,
	input wire sda_in,
	input reg [7:0]starting_byte,
	output reg rw_mode,
	output reg address_match,
	output reg stop_found,
	output reg start_found
);
reg meta_sda;
reg sync_sda;
reg meta_scl;
reg sync_scl;
reg start_found_;
reg stop_found_;



always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
	begin
		meta_sda<=0;
		sync_sda<=0;
		meta_scl<=0;
		sync_scl<=0;
		start_found<=0;	
		stop_found<=0;
	end
	else 
	begin
		meta_sda<=sda_in;
		sync_sda<=meta_sda;
		meta_scl<=scl;
		sync_scl<=meta_scl;	
		start_found<=start_found_;	
		stop_found<=stop_found_;			
	end
end


always_comb
begin
	start_found_=0;
	stop_found_=0;
	if (meta_sda==1'b0 && sync_sda==1'b1 && sync_scl==1'b1 && meta_scl==1'b1)
		start_found_=1;
	if (meta_sda==1'b1 && sync_sda==1'b0 && sync_scl==1'b1 && meta_scl==1'b1)
		stop_found_=1;
end

assign rw_mode = starting_byte[0];
assign address_match = starting_byte[7:1] == 7'b1111000;


endmodule