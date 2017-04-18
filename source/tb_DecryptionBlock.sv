// $Id: $
// File name:   tb_DecryptionBlock.sv
// Created:     4/11/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decryption test bench
`timescale 1ns/10ps

module tb_DecryptionBlock();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	
	
	
	// Test bench dut port signals
	reg tb_clk;
	reg tb_n_rst;
	reg tb_enable_decrypt;
	reg [127:0]tb_data_in;
	reg [127:0]tb_key_in;
	reg [127:0]tb_final_data_out;
	reg tb_dec_busy;

	
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
	DecryptionBlock DUT(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.enable_decrypt(tb_enable_decrypt),
		.data_in(tb_data_in),
		.key_in(tb_key_in),
		.final_data_out(tb_final_data_out),
		.dec_busy(tb_dec_busy)
	);
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		
		tb_n_rst=1;
		#(10ns)
		tb_n_rst=0;
		tb_enable_decrypt=0;
		#(10ns)
		tb_n_rst=1;
		#(10ns)		
		
		// Wait for some time before starting test cases
		tb_data_in = 128;hdeb0f81341f3503a7cd01e2bc7cdd556;
		tb_key_in =128'h5e74e7ba66b0c7cc1b7697b3f9f51527;
		#(10ns)
		tb_enable_decrypt=1;
		#(10ns)
		tb_enable_decrypt=0;
		#(750ns);
		if(tb_final_data_out == 128'h7d8ae0f7cfa0a6cb09fb5d05a8ec586d)
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
