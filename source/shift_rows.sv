// $Id: $
// File name:   shift_rows.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Shift Rows module
module shift_rows(
	input reg [127:0] in,
	output reg [127:0] out
);

always_comb begin : shifting
	out[31:0]={in[127:120],in[87:80],in[47:40],in[7:0]};
	out[63:32]={in[31:24],in[119:112],in[79:72],in[39:32]};
	out[95:64]={in[63:56],in[23:16],in[111:104],in[71:64]};
	out[127:96]={in[95:88],in[55:48],in[15:8],in[103:96]};
end

endmodule