`timescale 1ns / 1ps
module GCD_controller (done, ldA, ldB, sel_in, sel1, sel2, gt, lt, eq, start, clk);
	output reg done, ldA, ldB, sel_in, sel1, sel2;
	input gt, lt, eq, start, clk;
	reg [2:0] state;
	parameter s0=0, s1=1, s2=2, s3=3, s4=4, s5=5;
	
	always@(posedge clk) begin
		case(state)
			s0: if(start) state<=s1;
			s1: state<=s2;
			s2: begin #5 if(gt) state<=s3; if(lt) state<=s4; if(eq) state<=s5; end
			s3: begin #5 if(gt) state<=s3; if(lt) state<=s4; if(eq) state<=s5; end
			s4: begin #5 state<= gt ? s3: lt ? s4: eq? s5: s4;  end                    //// same as nested if-else condition
			s5: state<= s5;
			default: state<=s0;
		endcase
	end
	
	always@ (state) begin
		case(state)
			s0: begin done=0; ldA=0; ldB=0; sel_in=1'bx; sel1=1'bx; sel2=1'bx; end
			s1: begin sel_in=1; ldA=1; end
			s2: begin ldA=0; ldB=1; end
			s3: begin ldB=0; ldA=1; sel_in=0; sel1=1; sel2=0; end
			s4: begin ldA=0; ldB=1; sel_in=0; sel1=0; sel2=1; end
			s5: begin ldA=0; ldB=0; sel_in=0; /*sel1=1'bx; sel2=1'bx;*/ done=1; end
			default: begin done=0; ldA=0; ldB=0; sel_in=1'bx; sel1=1'bx; sel2=1'bx; end
		endcase
	end
endmodule