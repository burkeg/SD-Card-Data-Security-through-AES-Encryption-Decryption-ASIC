// $Id: $
// File name:   tb_gen_sub.sv
// Created:     3/14/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test bench for parallel s-boxes
`timescale 1ns/10ps

module tb_gen_sub();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	
	
	
	// Test bench dut port signals
	reg [127:0]tb_data_in;
	reg [127:0]tb_data_out;

	
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
	gen_sub DUT(.data_in(tb_data_in),.rcon(32'h01000000),.data_out(tb_data_out));
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		tb_data_in='0;
		
		
		// Wait for some time before starting test cases
		#(1ns);
		tb_data_in=128'hAFAdb59705579cce9fd3644f45e3008b;
		#(1ns);
		tb_data_in=tb_data_out;
		#(1ns);
		tb_data_in=tb_data_out;
		#(1ns);
		tb_data_in=tb_data_out;
		
		
		
		// TODO: Add non standard test cases here
		
	end
endmodule