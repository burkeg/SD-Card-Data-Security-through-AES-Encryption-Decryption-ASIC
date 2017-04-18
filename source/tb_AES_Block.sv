// $Id: $
// File name:   tb_AES_block.sv
// Created:     4/18/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test Bench for AES Block
`timescale 1ns/10ps

module tb_AES_Block ();

	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;

	reg tb_clk;
	reg tb_n_rst;
	reg tb_enable;
	reg tb_dec_req;
	reg tb_enc_req;
	reg [127:0] tb_key_in;
	reg [127:0] tb_data_in;
	reg [127:0] tb_data_out;
	reg tb_data_ready;

	integer tb_test_case_num;

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

	AES_Block DUT(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.enable(tb_enable),
		.dec_req(tb_dec_req),
		.enc_req(tb_enc_req),
		.key_in(tb_key_in),
		.data_in(tb_data_in),
		.data_out(tb_data_out),
		.data_ready(tb_data_ready)
	);


	initial
	begin
		tb_n_rst=0;
		tb_enable = 0;
		tb_dec_req = 0;
		tb_enc_req = 0;
		tb_key_in = 0;
		tb_data_in = 0;
		#(10ns);
		tb_n_rst=1;
		#(10ns);




		//Encryption Block Test
		tb_test_case_num = 0;
		tb_data_in=128'h7d8ae0f7cfa0a6cb09fb5d05a8ec586d;
		tb_key_in =128'h5e74e7ba66b0c7cc1b7697b3f9f51527;
		#(10ns);
		tb_enable = 1;
		#(10ns);
		tb_enable = 0;
		tb_enc_req = 1;
		#(10ns);
		tb_enc_req = 0;
		#(750ns);
		if(tb_data_out == 128'hdeb0f81341f3503a7cd01e2bc7cdd556)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end



		tb_n_rst=0;
		tb_enable = 0;
		tb_dec_req = 0;
		tb_enc_req = 0;
		tb_key_in = 0;
		tb_data_in = 0;
		#(10ns);
		tb_n_rst=1;
		#(10ns);

		tb_test_case_num = 1;
		tb_data_in = 128'hdeb0f81341f3503a7cd01e2bc7cdd556;
		tb_key_in =128'h5e74e7ba66b0c7cc1b7697b3f9f51527;
		#(10ns)
		tb_enable=1;
		#(10ns)
		tb_enable=0;
		tb_dec_req = 1;
		#(10ns);
		tb_dec_req = 0;
		#(750ns);
		if(tb_data_out == 128'h7d8ae0f7cfa0a6cb09fb5d05a8ec586d)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end




	end
endmodule
