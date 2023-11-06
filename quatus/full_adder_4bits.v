module full_adder_1bit( 
	input [3:0] A,B,
	output [3:0] S
	);
	
wire c0, c2, c1, cout;

full_adder_1bit F1 (A[0], B[0], 1'b0, S[0], c0);
full_adder_1bit F2 (A[1], B[1], c0, S[1], c1);
full_adder_1bit F3 (A[2], B[2], c1, S[2], c2);
full_adder_1bit F4 (A[3], B[3], c2, S[3], cout);

endmodule
