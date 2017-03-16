// $Id: $
// File name:   tb_gen_sub.sv
// Created:     3/14/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Test bench for parallel s-boxes
`timescale 1ns/10ps

module tb_gen_key();

	// Define local constants
	localparam NUM_VAL_BITS	= 16;
	localparam MAX_VAL_BIT	= NUM_VAL_BITS - 1;
	localparam CHECK_DELAY	= 1ns;
	localparam CLK_PERIOD		= 10ns;
	
	
	
	// Test bench dut port signals
	reg tb_clk;
	reg [127:0]tb_data_in;
	reg [127:0]tb_data_out[10:0];

	
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
	gen_key DUT(.data_in(tb_data_in),.data_out(tb_data_out));
	
	
	
	
	
	

	
	// Test bench process
	initial
	begin
		// Initial values
		tb_data_in='0;
		
		
		// Wait for some time before starting test cases
		#(1ns);
		tb_data_in=128'hAFAdb59705579cce9fd3644f45e3008b;
		#(25ns);
		if(tb_data_out[10] == 128'hAFAdb59705579cce9fd3644f45e3008b)
		#(1ns)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		if(tb_data_out[9] == 128'hBFCE88F9BA991437254A707860A970F3)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		if(tb_data_out[8] == 128'h6E9F8529D406911EF14CE16691E59195)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		if(tb_data_out[7] == 128'hB31EAFA867183EB69654DFD007B14E45)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		if(tb_data_out[6] == 128'h7331C16D1429FFDB827D200B85CC6E4E)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		if(tb_data_out[2] == 128'hda3eb0af430c540355223dbcf7268674)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		if(tb_data_out[0] == 128'h40c7dcc935b1aa0d15e5e175c2972c79)
		begin
			$info("Correct");
		end
		else
		begin
			$error("Incorrect");
		end

		//test 2
		tb_data_in=128'h61cd359550d93d14487441a0ad6624c8;
		#(25ns);
		if(tb_data_out[10] == 128'he157ed12fbc2426508afe3c9e7bca148)
		//if(tb_data_out[0] == 128'h61cd359550d93d14487441a0ad6624c8)
		#(1ns)
		begin
			$info("Correct test 2");
		end
		else
		begin
			$error("Incorrect test 2");
		end
	
		
		
		
		
		// TODO: Add non standard test cases here
		
	end
endmodule
