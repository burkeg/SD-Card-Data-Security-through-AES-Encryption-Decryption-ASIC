// $Id: $
// File name:   EncryptionBlock.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Byte Substitution block
module EncryptionBlock
(	
	input wire clk,
	input wire enable_encrypt,
	input reg [127:0]key_in,
	input reg [127:0] data_in,
	output reg [127:0]final_data_out 
	output reg enc_busy
);
reg count_enable;
reg [3:0]count_out;
reg [127:0]byte_out;
reg [127:0]rows_out;
reg [127:0]cols_out;
reg [127:0]rkey_out;
reg [127:0]curr_key;

reg [127:0]next_final_data_out;


always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
		final_data_out<='0;
	else
		final_data_out=next_final_data_out;
end

always_comb
begin
	if (reloop)
		next_final_data_out=final_data_out;
	else
		next_final_data_out=rkey_out;
end
	controller ctrlr (
		.clk(clk),
		.n_rst(n_rst),
		.reloop(reloop),
		.enable_encrypt(enable_encrypt),
		.clear(clear),
		.count_enable(count_enable),
		.enc_busy(enc_busy)
	);

	byte_sub bsub(
		.data_in(data_in),
		.count_out(count_out),
		.data_to_store(final_data_out),
		.key(key_in),
		.data_out(byte_out)
	);

	mix_col mcol (
		.data_in(rows_out),
		.count_out(count_out),
		.data_out(cols_out)
	);

	add_round_key ark (
		.data_in(cols_out),
		.key(curr_key),
		.data_out(rkey_out)
	);

	keyscheduler ksched (
		.key_in(key_in),
		.count_out(count_out),
		.curr_key(curr_key)
	);
	
	flex_counter cnter (
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear),
		.count_enable(count_enable),
		.count_out(count_out),
		.rollover_val(4'd10),
		.rollover_flag()
	);





endmodule