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
	out[127:96]={in[((15-0)*8)+7:(15-0)*8],in[((15-5)*8)+7:(15-5)*8],in[((15-10)*8)+7:(15-10)*8],in[((15-15)*8)+7:(15-15)*8]};
	out[95:64] ={in[((15-4)*8)+7:(15-4)*8],in[((15-9)*8)+7:(15-9)*8],in[((15-14)*8)+7:(15-14)*8],in[((15-3)*8)+7:(15-3)*8]};
	out[63:32] ={in[((15-8)*8)+7:(15-8)*8],in[((15-13)*8)+7:(15-13)*8],in[((15-2)*8)+7:(15-2)*8],in[((15-7)*8)+7:(15-7)*8]};
	out[31:00] ={in[((15-12)*8)+7:(15-12)*8],in[((15-1)*8)+7:(15-1)*8],in[((15-6)*8)+7:(15-6)*8],in[((15-11)*8)+7:(15-11)*8]};
end

endmodule