// $Id: $
// File name:   tb_decode.sv
// Created:     2/21/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decode Block Test Bench
`timescale 1ns / 100ps
module tb_decode
();
	// Define local parameters used by the test bench
	localparam CLK_PERIOD = 2.5;
	localparam NUM_CASES = 4;
	localparam TEST_DELAY = 10;
	// Declare Design Under Test (DUT) portmap signals
	reg	tb_clk;
	reg	tb_n_rst;
	reg	tb_scl;
	reg	tb_sda_in;
	reg	[7:0]tb_starting_byte;
	reg	tb_rw_mode;
	reg	tb_address_match;
	reg	tb_stop_found;
	reg	tb_start_found;
	


	// Declare test bench signals
	integer tb_test_case;


	// DUT port map
	decode DUT(.clk(tb_clk), .n_rst(tb_n_rst), .scl(tb_scl), .sda_in(tb_sda_in), .starting_byte(tb_starting_byte),.rw_mode(tb_rw_mode),.address_match(tb_address_match),.stop_found(tb_stop_found),.start_found(tb_start_found));
	
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

//0
		tb_test_case=0;
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//1
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//2
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//3
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//4
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//5
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//6
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//7
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//8
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//9
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//10
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);
		@(negedge tb_clk);	
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//11
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 1 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//12
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=0;
		@(negedge tb_clk);	
		@(negedge tb_clk);
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//13
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=0;
		tb_sda_in=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//14
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=0;
		@(negedge tb_clk);	
		@(negedge tb_clk);
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 1 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

//15
		@(negedge tb_clk);	
		tb_n_rst=0;
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);			
		tb_scl=1;
		tb_sda_in=1;
		@(negedge tb_clk);	
		@(negedge tb_clk);
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_start_found == 0 && tb_stop_found == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_starting_byte=8'hF0;
		#(1)
		if(tb_address_match == 1 && tb_rw_mode == 0 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_starting_byte=8'hF1;
		#(1)
		if(tb_address_match == 1 && tb_rw_mode == 1 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;


		tb_starting_byte=8'hD1;
		#(1)
		if(tb_address_match == 0 && tb_rw_mode == 1 )
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_starting_byte=8'hD0;
		#(1)
		if(tb_address_match == 0 && tb_rw_mode == 0 )
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
	