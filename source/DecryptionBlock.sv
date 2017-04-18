// $Id: $
// File name:   DecryptionBlock.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decryption Block

module DecryptionBlock
(	
	input wire clk,
	input wire n_rst,
	input wire enable_decrypt,
	input reg [127:0] key_in,
	input reg [127:0] data_in,
	input reg [127:0]curr_key,
	output reg [127:0] final_data_out,
	output reg [3:0] dec_count_out,
	output reg dec_busy
);
reg count_enable;
reg reloop;

reg [127:0]byte_in;
reg [127:0]byte_out;
reg [127:0]rows_in;
reg [127:0]cols_in;
reg [127:0]rkey_out;

reg [127:0]next_final_data_out;


always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
		final_data_out<='0;
	else
		final_data_out<=next_final_data_out;
end

always_comb
begin
	if (reloop)
		next_final_data_out=final_data_out;
	else
		next_final_data_out=byte_out;
end
	inv_controller ctrlr (
		.clk(clk),
		.n_rst(n_rst),
		.reloop(reloop),
		.enable_decrypt(enable_decrypt),
		.clear(clear),
		.count_out(dec_count_out),
		.count_enable(count_enable),
		.dec_busy(dec_busy)
	);

	inv_byte_sub inv_bsub(
		.data_in(byte_in),
		.count_out(dec_count_out),
		.key(key_in),
		.data_out(byte_out)
	);

	inv_shift_rows srows(
		.in(rows_in),
		.out(byte_in)
	);

	inv_mix_col mcol (
		.data_in(cols_in),
		.count_out(dec_count_out),
		.data_out(rows_in)
	);

	inv_add_round_key ark (
		.data_in(data_in),
		.data_store(final_data_out),
		.count_in(dec_count_out),
		.key(curr_key),
		.data_out(cols_in)
	);

	flex_counter cnter (
		.clk(clk),
		.n_rst(n_rst),
		.clear(clear),
		.count_enable(count_enable),
		.count_out(dec_count_out),
		.rollover_val(4'd10),
		.rollover_flag()
	);



endmodule
