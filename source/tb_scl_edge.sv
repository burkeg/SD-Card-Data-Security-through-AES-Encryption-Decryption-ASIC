// $Id: $
// File name:   tb_scl_edge.sv
// Created:     2/20/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test Bench for SCL Edge detector
`timescale 1ns / 100ps
module tb_scl_edge
();
	// Define local parameters used by the test bench
	localparam CLK_PERIOD = 2.5;
	localparam NUM_CASES = 4;
	localparam TEST_DELAY = 10;
	// Declare Design Under Test (DUT) portmap signals
	reg	tb_clk;
	reg	tb_n_rst;
	reg	tb_scl;
	reg	tb_rising_edge_found;
	reg	tb_falling_edge_found;
	


	// Declare test bench signals
	integer tb_test_case;


	// DUT port map
	scl_edge DUT(.clk(tb_clk), .n_rst(tb_n_rst), .scl(tb_scl), .rising_edge_found(tb_rising_edge_found), .falling_edge_found(tb_falling_edge_found));

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	// Test bench process
	initial
	begin
		// Initialize test inputs for DUT
		tb_scl=0;
		tb_test_case=0;
		@(negedge tb_clk);	
		tb_n_rst=1'b0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);		
		tb_scl=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_rising_edge_found == 1 && tb_falling_edge_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		@(negedge tb_clk);			
		tb_scl=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_rising_edge_found == 1 && tb_falling_edge_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;


		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		@(negedge tb_clk);			
		tb_scl=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_rising_edge_found == 1 && tb_falling_edge_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;


		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		@(negedge tb_clk);			
		tb_scl=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_rising_edge_found == 1 && tb_falling_edge_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;
		#(TEST_DELAY - 1);
		
		
	end

	// Wrap-up process
	final
	begin
		if(NUM_CASES != tb_test_case)
		begin
			// Didn't run the test bench through all test cases
			$display("This test bench was not run long enough to execute all test cases. Please run this test bench for at least a total of %d ns", (NUM_CASES * TEST_DELAY));
		end
		else
		begin
			// Test bench was run to completion
			$display("This test bench has run to completion");
		end
	end
endmodule
	