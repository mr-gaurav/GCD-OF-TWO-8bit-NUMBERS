`timescale 1ns / 1ps

module GCD_test;
	reg start, clk;
	reg [7:0] data;
	wire done;
	
	GCD_datapath dut1 (gt,lt,eq, data, ldA, ldB, sel_in, sel1, sel2, clk);
	GCD_controller dut2 (done, ldA, ldB, sel_in, sel1, sel2, gt, lt, eq, start, clk);
	
	initial clk=0;
	always #5 clk=~clk;
	initial begin
		$dumpfile ("GCD_test.vcd");
		$dumpvars(0,GCD_test);
		$monitor("time=%g,state=%3d, A=%8d, B=%8d, result=%8d, done=%b", $time,dut2.state, dut1.A, dut1.B, dut1.A, dut2.done);
		
		start=1;
		#3 data=91;
		#27 data=234;
		#500 $finish;
	end
endmodule