// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/30/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Flexible Counter
module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input reg[NUM_CNT_BITS-1:0] rollover_val,
	output reg[NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);

reg[NUM_CNT_BITS-1:0] thereg;

reg currRoll;
always_comb
begin
	if(clear)
	begin
		thereg='0;
		currRoll=0;
	end
	else if(count_enable)
	begin
		if (rollover_flag)
		begin
			thereg=1;
			currRoll=0;
		end
		else 
			thereg=count_out+1;
		if(thereg == rollover_val)
			currRoll=1;
		else
			currRoll=0;
	end
	else
	begin
		thereg=count_out;
		currRoll=rollover_flag;
	end
	
	
end

always_ff @ (posedge clk, negedge n_rst)
begin
	if(n_rst == 1'b0)
	begin
		count_out <= '0;
		rollover_flag <= 0;
	end
	else 
	begin	
		count_out<=thereg;	
		rollover_flag<=currRoll;	
	end
			
end


endmodule
