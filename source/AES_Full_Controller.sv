// $Id: $
// File name:   AES_Full_Controller.sv
// Created:     4/18/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: AES Controller

module AES_Full_Controller
(
input wire clk,
input wire n_rst,
input wire decrypt_request,
input wire encrypt_request,
input wire data_ready_i,
input wire enc_busy,
input wire dec_busy,
output reg data_ready_o,
output reg enable_encr,
output reg enable_decr,
output reg mode
);


typedef enum bit [2:0] {IDLE,WAIT,ENC,DEC,WAIT_ENC,WAIT_DEC,ENC_DONE,DEC_DONE} stateType;
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
	data_ready_o = 0;
	enable_encr = 0;
	enable_decr = 0;
	mode = 0;
	case(state)

	IDLE: begin
	if (data_ready_i == 1)
		nextstate=WAIT;
	end

	WAIT: begin
	if(decrypt_request == 1)
		nextstate=DEC;
	else if(encrypt_request == 1)
		nextstate=ENC;
	end

	ENC: begin
	nextstate = WAIT_ENC;
	enable_encr = 1;
	mode = 1;
	end

	WAIT_ENC: begin
	mode = 1;
	if(enc_busy == 0)
		nextstate = ENC_DONE;
	end

	ENC_DONE: begin
	nextstate = IDLE;
	data_ready_o = 1;
	mode = 1;
	end

	DEC: begin
	nextstate = WAIT_DEC;
	enable_decr = 1;
	end

	WAIT_DEC: begin
	if(dec_busy == 0)
		nextstate = DEC_DONE;
	end

	DEC_DONE: begin
	nextstate = IDLE;
	data_ready_o = 1;
	mode = 0;
	end


	
	default:
		nextstate=IDLE;
	
endcase
end


endmodule
