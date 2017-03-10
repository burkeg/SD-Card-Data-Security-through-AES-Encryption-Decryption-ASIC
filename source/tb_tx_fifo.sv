// $Id: $
// File name:   tb_tx_fifo.sv
// Created:     2/21/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: TX_FIFO Test Bench
`timescale 1ns / 100ps
module tb_tx_fifo
();
	// Define local parameters used by the test bench
	localparam CLK_PERIOD = 2.5;
	localparam NUM_CASES = 4;
	localparam TEST_DELAY = 10;
	// Declare Design Under Test (DUT) portmap signals
	reg	tb_clk;
	reg	tb_n_rst;
	reg	tb_read_enable;
	reg	tb_write_enable;
	reg	[7:0]tb_write_data;
	reg	[7:0]tb_read_data;
	reg	tb_fifo_empty;
	reg	tb_fifo_full;
	


	// Declare test bench signals
	integer tb_test_case;


	// DUT port map
	tx_fifo DUT(.clk(tb_clk), .n_rst(tb_n_rst),.read_enable(tb_read_enable),.write_enable(tb_write_enable),.write_data(tb_write_data),.read_data(tb_read_data),.fifo_empty(tb_fifo_empty),.fifo_full(tb_fifo_full));
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
		tb_n_rst=0;			
		tb_write_enable=0;			
		tb_read_enable=0;			
		tb_write_data='0;			
		tb_read_data='0;
		
		@(negedge tb_clk);			
		tb_n_rst=1;
		@(negedge tb_clk);	
		
		tb_write_data=8'b11111111;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);	
		#(1)
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_read_data == 8'b11111111)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;


		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		#(1)
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_fifo_empty == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;


		tb_write_data=8'b11000111;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);			
		tb_write_enable=1;
		@(negedge tb_clk);	
		tb_write_enable=0;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		#(1)
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_fifo_full == 1)
			$info("Correct value for test case %d!", tb_test_case);
		else
			$info("Incorrect value for test case %d!", tb_test_case);
		tb_test_case=tb_test_case+1;

		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);			
		tb_read_enable=1;
		@(negedge tb_clk);	
		tb_read_enable=0;
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		@(negedge tb_clk);	
		#(1)
		// Wait for a bit to allow this process to catch up with assign statements triggered
		// by test input assignment above
		if(tb_fifo_full == 0 && tb_fifo_empty == 1)
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