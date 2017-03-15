// $Id: $
// File name:   tb_s_box_flex.sv
// Created:     3/14/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test bench for parallel s-boxes
`timescale 1ns/10ps

module tb_s_box_flex();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	
	// Test bench dut port signals
	reg [127:0]tb_s_box_in;
	reg [127:0]tb_s_box_out;
	
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
	s_box_flex DUT(.s_box_in(tb_s_box_in),.s_box_out(tb_s_box_out));
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		tb_s_box_in='0;
		
		// Wait for some time before starting test cases
		#(1ns);
		tb_s_box_in=128'h442c75793b6b577b467e6b2e66;
		#(1ns);
		tb_s_box_in=128'h253437672b242734436f4e5d4e;
		#(1ns);
		tb_s_box_in=128'h2b66473c427c485b3e6f573154;
		#(1ns);
		tb_s_box_in=128'h7e383027644a5641297e3f7129;
		#(1ns);
		
		
		
		// TODO: Add non standard test cases here
		
	end
endmodule
