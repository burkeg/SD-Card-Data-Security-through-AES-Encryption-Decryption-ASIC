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
	output wire clear,
	output wire count_enable,
	output wire reloop,
	output wire enc_busy

);
typedef enum bit [3:0] {IDLE,SEND,WACKNACK,NACK,PACK,LOAD,TRAN,TRANW,READ,WACK} stateType;
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
	read_enable=0;
	load_data=0;
	sda_mode=0;
	tx_enable=0;
	rx_enable=0;
	
	case(state)

	IDLE: begin
	if (start_found==1)
		nextstate=SEND;
	end

	SEND: begin
	if (byte_received==1)
		nextstate=WACKNACK;
	sda_mode=2'b00;
	rx_enable=1'b1;
	
	end

	WACKNACK: begin
	if (address_match==1 && ack_prep==1 && rw_mode==1)
		nextstate=PACK;
	else if (ack_prep==1 && (rw_mode==0 | address_match==0))
		nextstate=NACK;
	
	end

	NACK: begin
	if (ack_done==1)
		nextstate=IDLE;
	sda_mode=2'b10;
	end

	PACK: begin
	if (ack_done==1)
		nextstate=LOAD;
	sda_mode=2'b01;
	end

	LOAD: begin
	nextstate=TRAN;
	sda_mode=2'b11;
	load_data=1;

	end

	TRAN: begin
	if (ack_prep==1)
		nextstate=TRANW;
	sda_mode=2'b11;
	tx_enable=1;
	end

	TRANW: begin
	if (check_ack==1)
		nextstate=READ;
	end

	READ: begin
	if (sda_in==0)
		nextstate=WACK;
	else 
		nextstate=IDLE;
	read_enable=1;
	end

	WACK: begin
	if (ack_done==1)
		nextstate=LOAD;
	end

	
	default:
		nextstate=IDLE;
	
endcase
end

endmodule
