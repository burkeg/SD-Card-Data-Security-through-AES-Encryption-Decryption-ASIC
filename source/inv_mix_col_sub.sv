// $Id: $
// File name:   inv_mix_col_sub.sv
// Created:     4/4/2017
// Author:      Caleb Withers
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Decyrption Mix Column Substitution
module inv_mix_col_sub
(
	input reg [31:0]data_in,
	output reg [31:0]data_out 
);

reg [7:0] in14[3:0];
reg [7:0] in13[3:0];
reg [7:0] in11[3:0];
reg [7:0] in9[3:0];


reg [7:0] out14[3:0];
reg [7:0] out13[3:0];
reg [7:0] out11[3:0];
reg [7:0] out9[3:0];

genvar i;
generate
for (i = 0; i < 4 ; i = i + 1) begin: col_subs
	assign in14[i]=data_in[((i+0)%4)*8+7:((i+0)%4)*8];
	assign in11[i]=data_in[((i+3)%4)*8+7:((i+3)%4)*8];
	assign in13[i]=data_in[((i+2)%4)*8+7:((i+2)%4)*8];
	assign in9[i]=data_in[((i+1)%4)*8+7:((i+1)%4)*8];
	mul14 multi14 (.mul14_in(in14[i]),.mul14_out(out14[i]));
	mul11 multi11 (.mul11_in(in11[i]),.mul11_out(out11[i]));
	mul13 multi13 (.mul13_in(in13[i]),.mul13_out(out13[i]));
	mul9 multi9 (.mul9_in(in9[i]),.mul9_out(out9[i]));
	assign data_out[i*8+7:i*8] = out14[i] ^ out11[i] ^ out13[i] ^ out9[i];
end
endgenerate
endmodule
