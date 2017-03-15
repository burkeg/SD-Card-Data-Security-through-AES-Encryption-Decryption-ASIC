// $Id: $
// File name:   gen_sub.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Generate Round keys subblock
module gen_sub(
	input wire [127:0] data_in,
	input wire [31:0] rcon,
	output reg [127:0] data_out
);
	reg [31:0] outG;
	operationG opG (.data_in(data_in[31:0]),.rcon(rcon),.data_out(outG));
	
always_comb
begin
	data_out[127:96]=outG^data_in[127:96];
	data_out[95:64]=data_out[127:96]^data_in[95:64];
	data_out[63:32]=data_out[95:64]^data_in[63:32];
	data_out[31:0] =data_out[63:32]^data_in[31:0];
end

endmodule
