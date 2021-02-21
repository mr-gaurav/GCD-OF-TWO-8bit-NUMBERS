module LOAD(out, in, enable, clk);
	output reg [7:0] out;
	input [7:0] in;
	input enable, clk;
	
	always@(posedge clk) begin
		if(enable)
			out<=in;
	end
endmodule