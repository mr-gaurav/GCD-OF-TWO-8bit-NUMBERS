module COMPARATOR(gt, lt, eq, in1, in2);
	output reg gt, lt, eq;
	input [7:0] in1, in2;
	
	always@(*) begin
		gt<=0;
		lt<=0;
		eq<=0;
		if(in1>in2)
			gt<=1;
		else if(in1<in2)
			lt<=1;
		else if (in1==in2)
			eq<=1;
	end
endmodule