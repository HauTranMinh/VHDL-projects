module BT_1 (
	input [3:0] x,
	output reg [1:0] y,
	output reg GS,E
);

always @(*) begin
	E 	= &~x;
	GS 	= |x;
	y[1] = x[2] | x[3];
	y[0] = (x[3] | (x[1] & ~ x[2]))

end

endmodule