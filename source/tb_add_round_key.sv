// $Id: $
// File name:   add_round_key.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Add Round Key Module

`timescale 1ns/10ps

module tb_add_round_key();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD	= 10ns;
	
	
	
	// Test bench dut port signals
	reg [127:0]tb_data_in;
	reg [127:0]tb_data_out;
	reg [127:0]tb_key;

	
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
	add_round_key DUT(.data_in(tb_data_in),.key(tb_key),.data_out(tb_data_out));
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		tb_data_in='0;
		tb_key='0;
		
		
		// Wait for some time before starting test cases
		#(1ns);
		tb_data_in=128'h00112233445566778899aabbccddeeff;
		tb_key    =128'hffeeddccbbaa99887766554433221100;
		
		#(1ns);
		if(tb_data_out == 128'hffffffffffffffffffffffffffffffff)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		tb_data_in=128'h00000000000000000000e1fe90ef69ce;
		tb_key    =128'h0000000000000000000037e21c963f6e;
		
		#(1ns);
		if(tb_data_out == 128'h00000000000000000000d61c8c7956a0)
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
