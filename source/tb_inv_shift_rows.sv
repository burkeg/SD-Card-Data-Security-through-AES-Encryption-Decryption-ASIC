// $Id: $
// File name:   tb_inv_shift_rows.sv
// Created:     4/11/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test Bench for Inv Shift Rows
`timescale 1ns/10ps

module tb_inv_shift_rows();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	
	
	
	// Test bench dut port signals
	reg [127:0]tb_in;
	reg [127:0]tb_out;

	
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
	inv_shift_rows DUT(.in(tb_in),.out(tb_out));
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		tb_in='0;
		
		
		// Wait for some time before starting test cases
		#(1ns);
		tb_in=128'h9cc52af78b0678f21b8b3ef8e8346d48;
		#(12ns);
		if(tb_out == 128'h9c343ef28bc56df81b062a48e88b78f7)
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
