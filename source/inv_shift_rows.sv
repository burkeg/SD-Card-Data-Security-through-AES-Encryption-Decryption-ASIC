// $Id: $
// File name:   inv_shift_rows.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decryption Shift Rows 
module inv_shift_rows(
	input reg [127:0] in,
	output reg [127:0] out
);

always_comb begin : inverse_shifting
	out[127:96] = {in[127:120],in[23:16],in[47:40],in[71:64]};
	out[95:64]  = {in[95:88],in[119:112],in[15:08],in[39:32]};
	out[63:32]  = {in[63:56],in[87:80],in[111:104],in[07:00]};
	out[31:00]  = {in[31:24],in[55:48],in[79:72], in[103:96]};

	/*
	out[127:96] = {in[127:120],in[95:88],in[63:56],in[31:24]};
	out[95:64]  = {in[23:16],in[119:112],in[87:80],in[55:48]};
	out[63:32]  = {in[47:40],in[15:08],in[111:104],in[79:72]};
	out[31:00]  = {in[71:64],in[39:32],in[07:00],in[103:96]};
	*/
end

endmodule
