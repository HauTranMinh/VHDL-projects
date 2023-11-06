module MUX4_1 (
	input 	[1:0] A,
	input 	E,
	output reg 	[3:0] temp,
	output reg	[3:0] output_final
);

always @(*) begin:
	if (E) begin
		output_final = 4'b1111;
	end
	else begin
		case (A)
			0: output_final = 4'b1110;
			1: output_final = 4'b1101;
			2: output_final = 4'b1011;
			3: output_final = 4'b0111;
			default : output_final = 4'bxxxx;
		endcase
	end
end

endmodule