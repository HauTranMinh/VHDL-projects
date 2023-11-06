module D_FF (
	input clk,    // Clock
	input w, // data input
	input rst_n,  // Asynchronous reset active low

	output reg z // output
);

reg Y2, Y1

always @(posedge clk) begin
	z <= w;
end


endmodule