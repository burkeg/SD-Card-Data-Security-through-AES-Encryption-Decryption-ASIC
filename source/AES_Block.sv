// $Id: $
// File name:   AES_Block.sv
// Created:     4/11/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: AES Overarching Block

module AES_Block
(
	input wire clk,
	input wire n_rst,
	input wire enable,
	input wire dec_req,
	input wire enc_req,
	input reg [127:0] key_in,
	input reg [127:0] data_in,
	output reg[127:0] data_out,
	output reg data_ready
);

reg reloop;
reg [127:0] curr_key;
reg [3:0] enc_count_out;
reg [3:0] dec_count_out;
reg [127:0] enc_data;
reg [127:0] dec_data;
reg mode;
reg enc_busy;
reg dec_busy;
reg enc_enable;
reg dec_enable;
reg [127:0] next_data_out;

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
		data_out<='0;
	else
		data_out<=next_data_out;
end
always_comb
begin
	next_data_out = data_out;
	if (data_ready)
	begin
		if(mode)
			next_data_out = enc_data;
		else
			next_data_out = dec_data;
	end	
end

	AES_Full_Controller AES1 (
		.clk(clk),
		.n_rst(n_rst),
		.decrypt_request(dec_req),
		.encrypt_request(enc_req),
		.data_ready_i(enable),
		.enc_busy(enc_busy),
		.dec_busy(dec_busy),
		.data_ready_o(data_ready),
		.enable_encr(enc_enable),
		.enable_decr(dec_enable),
		.mode(mode)
	);

	keyscheduler ksched (
		.key_in(key_in),
		.mode(mode),
		.enc_count_out(enc_count_out),
		.dec_count_out(dec_count_out),
		.curr_key(curr_key)
	);
	
	DecryptionBlock AES_Dec (
		.clk(clk),
		.n_rst(n_rst),
		.enable_decrypt(dec_enable),
		.key_in(key_in),
		.curr_key(curr_key),
		.data_in(data_in),
		.final_data_out(dec_data),
		.dec_count_out(dec_count_out),
		.dec_busy(dec_busy)
	);
	
	EncryptionBlock AES_Enc (
		.clk(clk),
		.n_rst(n_rst),
		.enable_encrypt(enc_enable),
		.key_in(key_in),
		.curr_key(curr_key),
		.data_in(data_in),
		.final_data_out(enc_data),
		.enc_count_out(enc_count_out),
		.enc_busy(enc_busy)
	);
	

endmodule
