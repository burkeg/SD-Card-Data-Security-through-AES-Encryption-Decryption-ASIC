// $Id: $
// File name:   controller.sv
// Created:     2/22/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Controller Block
module controller(
	input wire clk,
	input wire n_rst,
	input wire enable_encrypt,
	input wire [3:0]count_out,
	output reg clear,
	output reg count_enable,
	output reg reloop,
	output reg enc_busy

);
typedef enum bit [3:0] {IDLE,WAIT0,WAIT1,ACTIVE0,ACTIVE1,LAST} stateType;
stateType state,nextstate;

	

always_ff @(posedge clk, negedge n_rst)
begin:StateReg
	if(n_rst == 0)
		state<=IDLE;
	else
		state<=nextstate;
end

always_comb begin : Next_state
	nextstate=state;
	clear=0;
	count_enable=0;
	reloop=1;
	enc_busy=1;
	
	case(state)

	IDLE: begin
	if (enable_encrypt==1)
		nextstate=WAIT0;
	enc_busy=0;
	end

	WAIT0: begin
	nextstate=WAIT1;
	clear=1;
	end

	WAIT1: begin
	nextstate=ACTIVE0;
	end

	ACTIVE0: begin
	nextstate=ACTIVE1;
	reloop=0;
	count_enable=1;
	end

	ACTIVE1: begin
	if (count_out==4'd9)
		nextstate=LAST;
	else
		nextstate=ACTIVE0;
	end

	LAST: begin
	nextstate=IDLE;
	reloop=0;
	end
	
	default:
		nextstate=IDLE;
	
endcase
end

endmodule
