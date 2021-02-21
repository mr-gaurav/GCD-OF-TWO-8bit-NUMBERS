module SUBTRACTOR(out, in1, in2);
	output reg [7:0] out;
	input [7:0] in1, in2;
	
	always@(*) begin
		out<=in1-in2;
	end
endmodule