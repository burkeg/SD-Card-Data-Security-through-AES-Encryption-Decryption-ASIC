// $Id: $
// File name:   tb_EncryptionBlock.sv
// Created:     3/14/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test bench for parallel s-boxes
`timescale 1ns/10ps

module tb_EncryptionBlock();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 1ns;
	
	
	
	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_enable_encrypt;
	reg [127:0]tb_data_in;
	reg [127:0]tb_key_in;
	reg [127:0]tb_final_data_out;
	reg tb_enc_busy;

	
	// Test bench verification signals
	integer tb_test_case_num;
	

	
	// Clock gen block

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end

	// DUT portmap
	EncryptionBlock DUT(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.enable_encrypt(tb_enable_encrypt),
		.data_in(tb_data_in),
		.key_in(tb_key_in),
		.final_data_out(tb_final_data_out),
		.enc_busy(tb_enc_busy)
	);
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		
		tb_n_rst=1;
		#(10ns)
		tb_n_rst=0;
		tb_enable_encrypt=0;
		#(10ns)
		tb_n_rst=1;
		#(10ns)		
		
		// Wait for some time before starting test cases
		tb_data_in=128'h7d8ae0f7cfa0a6cb09fb5d05a8ec586d;
		tb_key_in =128'h5e74e7ba66b0c7cc1b7697b3f9f51527;
		#(10ns)
		tb_enable_encrypt=1;
		#(10ns)
		tb_enable_encrypt=0;
		#(750ns);
		if(tb_final_data_out == 128'hdeb0f81341f3503a7cd01e2bc7cdd556)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end
		//test 2	
/*
		#(1ns)
		tb_data_in=128'hAFAdb59705579cce9fd3644f45e3008b;
		tb_key_in =128'h0;
		#(99ns);
		if(tb_final_data_out == 128'hAFAdb59705579cce9fd3644f45e3008b)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end		
*/
		
		
		// TODO: Add non standard test cases here
		
	end
endmodule