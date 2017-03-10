// $Id: $
// File name:   tb_i2c_slave.sv
// Created:     2/27/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: TB for slave block
`timescale 1ns / 100ps
module tb_i2c_slave
();
	// Define local parameters used by the test bench
	localparam CLK_PERIOD = 2.5;
	localparam SCL_PERIOD = 25;
	localparam NUM_CASES = 5;
	localparam TEST_DELAY = 10;
	
	reg [1:0]tb_scl_read;
	reg [1:0]tb_scl_write;
	reg [1:0]tb_sda_read;
	reg [1:0]tb_sda_write;
	reg tb_clk;
	reg tb_n_rst;
	reg tb_scl;
	reg tb_sda_in;
	reg tb_write_enable;
	reg [7:0]tb_write_data;
	reg tb_fifo_empty;
	reg tb_fifo_full;
	

	// Declare test bench signals
	integer tb_test_case;

	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
	
	i2c_slave DUT(.clk(tb_clk), .n_rst(tb_n_rst),.scl(tb_scl_read[1]),.sda_in(tb_sda_read[1]),.sda_out(tb_sda_write[1]),.write_enable(tb_write_enable),.write_data(tb_write_data),.fifo_empty(tb_fifo_empty),.fifo_full(tb_fifo_full));
	i2c_bus BUS(.scl_read(tb_scl_read),.scl_write(tb_scl_write),.sda_read(tb_sda_read),.sda_write(tb_sda_write));

	task clk_scl;
	begin
		tb_scl_write[0] = 1'b0;
		#(SCL_PERIOD/4.0);
		tb_scl_write[0] = 1'b1;
		#(SCL_PERIOD/2.0);
	end
	endtask

	task start_cond;
	begin
		tb_sda_write[0]=1;
		tb_scl_write[0]=1;
		@(negedge tb_clk);
		tb_sda_write[0]=0;
		tb_scl_write[0]=1;
		@(negedge tb_clk);
	end
	endtask

	task stop_cond;
	begin
		tb_sda_write[0]=0;
		tb_scl_write[0]=1;
		@(negedge tb_clk);
		tb_sda_write[0]=1;
		tb_scl_write[0]=1;
		@(negedge tb_clk);
	end
	endtask
				


	

	initial
	begin	
		tb_scl_write[1]=1'bZ;
		tb_test_case=5;
		tb_n_rst=0;
		@(negedge tb_clk);
		tb_n_rst=1;
		@(negedge tb_clk);
		start_cond();
	end
	
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
	