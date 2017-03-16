// $Id: $
// File name:   gen_key.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Generate Round keys block
module gen_key(
	input wire [127:0] data_in,
	output reg [127:0] data_out[10:0]
);

reg [31:0] rcon [0:9];

	
always_comb
begin
	data_out[10]=data_in;
	rcon = '{32'h01000000,32'h02000000,32'h04000000,32'h08000000,32'h10000000,32'h20000000,32'h40000000,32'h80000000,32'h1b000000,32'h36000000};
end

genvar i;
generate
for (i = 1; i < 11 ; i = i + 1) begin: build_subs
	gen_sub sub (.data_in(data_out[11-i]),.rcon(rcon[i-1]),.data_out(data_out[10-i]));
end
endgenerate


endmodule
