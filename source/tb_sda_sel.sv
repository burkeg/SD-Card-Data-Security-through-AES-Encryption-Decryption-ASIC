// $Id: $
// File name:   tb_sda_sel.sv
// Created:     2/20/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: SDA Select Test Bench
`timescale 1ns / 100ps
module tb_sda_sel
();
	// Define local parameters used by the test bench
	localparam CLK_PERIOD = 2.5;
	localparam NUM_CASES = 5;
	localparam TEST_DELAY = 10;
	// Declare Design Under Test (DUT) portmap signals
	reg	tb_tx_out;
	reg	[1:0]tb_sda_mode;
	reg	tb_sda_out;
	


	// Declare test bench signals
	integer tb_test_case;


	// DUT port map
	sda_sel DUT(.tx_out(tb_tx_out), .sda_mode(tb_sda_mode), .sda_out(tb_sda_out));


	
	// Test bench process
	initial
	begin
		// Initialize test inputs for DUT
		tb_test_case=0;
						

		
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		tb_tx_out=0;
		tb_sda_mode=2'b00;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;
		tb_tx_out=1;
		tb_sda_mode=2'b00;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_tx_out=0;
		tb_sda_mode=2'b01;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 0)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;
		tb_tx_out=1;
		tb_sda_mode=2'b01;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 0)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_tx_out=0;
		tb_sda_mode=2'b10;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;
		tb_tx_out=1;
		tb_sda_mode=2'b10;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_tx_out=0;
		tb_sda_mode=2'b11;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 0)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		tb_tx_out=1;
		tb_sda_mode=2'b11;
		#(TEST_DELAY - 2);
		if(tb_sda_out == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		// Wait for DUT to process the inputs
		#(TEST_DELAY - 2);
		
		
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
	