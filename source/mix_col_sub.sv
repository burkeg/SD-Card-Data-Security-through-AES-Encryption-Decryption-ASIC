// $Id: $
// File name:   mix_col_sub.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Mix Columns SubModule.
module mix_col_sub
(
	input reg [31:0]data_in,
	output reg [31:0]data_out 
);

reg [7:0] in2[3:0];
reg [7:0] in3[3:0];

reg [7:0] out2[3:0];
reg [7:0] out3[3:0];

genvar i;
generate
for (i = 0; i < 4 ; i = i + 1) begin: col_subs
	assign in2[i]=data_in[((i+0)%4)*8+7:((i+0)%4)*8];
	assign in3[i]=data_in[((i+3)%4)*8+7:((i+3)%4)*8];
	mul2 multi2 (.mul2_in(in2[i]),.mul2_out(out2[i]));
	mul3 multi3 (.mul3_in(in3[i]),.mul3_out(out3[i]));
	assign data_out[i*8+7:i*8] = out2[i] ^ out3[i] ^ data_in[((i+2)%4)*8+7:((i+2)%4)*8] ^ data_in[((i+1)%4)*8+7:((i+1)%4)*8];
	
end
endgenerate
endmodule



