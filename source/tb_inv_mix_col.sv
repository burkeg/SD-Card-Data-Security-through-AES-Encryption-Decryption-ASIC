// $Id: $
// File name:   tb_inv_mix_col.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Inv Mix Col
`timescale 1ns/10ps

module tb_inv_mix_col();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	

	// Test bench dut port signals
	reg [127:0]tb_data_in;
	reg [127:0]tb_data_out;
	reg [3:0]tb_count_out;

	
	// Test bench verification signals
	integer tb_test_case_num;
	

	
	// Clock gen block
/*
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2.0);
	end
*/
	// DUT portmap
	inv_mix_col DUT(.data_in(tb_data_in),.count_out('0),.data_out(tb_data_out));
	
	// Test bench process
	initial
	begin
		// Initial values
		tb_data_in='0;
		tb_count_out='0;
		
		
		// Wait for some time before starting test cases
		#(1ns);
		tb_data_in=128'h22e259368b9426f9fcb68e84db3fc9c0;
		#(1ns);
		if(tb_data_out == 128'hee52d0c3adde9b28cd783fca84dd57e3)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end
		
		// TODO: Add non standard test cases here
	end
endmodule
