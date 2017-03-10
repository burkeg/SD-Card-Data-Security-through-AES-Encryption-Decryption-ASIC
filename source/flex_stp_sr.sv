// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/30/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Flexible StP SR
module flex_stp_sr
#(
	parameter NUM_BITS = 4,
	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire serial_in,
	output reg[NUM_BITS-1:0] parallel_out
);

reg[NUM_BITS-1:0] nxt_data;

always_comb
begin

	if(shift_enable)
	begin
		if(SHIFT_MSB)
		begin
			nxt_data[NUM_BITS-1:1]=parallel_out[NUM_BITS-2:0];
			nxt_data[0]=serial_in;
		end
		else
		begin
			nxt_data[NUM_BITS-2:0]=parallel_out[NUM_BITS-1:1];
			nxt_data[NUM_BITS-1]=serial_in;
		end
	end
	else
	begin
		nxt_data=parallel_out;
	end
end

always_ff @ (negedge n_rst, posedge clk)
begin
	if(1'b0 == n_rst)
		parallel_out <= '1;
	else 
		parallel_out<=nxt_data;
			
end

endmodule

