// $Id: $
// File name:   mul9.sv
// Created:     3/12/2017
// Author:      Gabriel Burke
// Lab Section: 337-02
// Version:     1.0  Initial Design Entry
// Description: Multiply by 9 table 

module s_box(
	input wire [7:0]mul9_in,
	output reg [7:0]mul9_out
);

always_comb begin : mul_case
	mul9_out=8'h63;

	case(mul9_in)
endcase
end

endmodule