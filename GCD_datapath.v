`timescale 1ns / 1ps
module GCD_datapath(gt,lt,eq, data, ldA, ldB, sel_in, sel1, sel2, clk);
	output gt, lt, eq;
	input ldA, ldB, sel1, sel2, sel_in, clk;
	input [7:0] data;
	wire [7:0] A, B, X, Y, bus, sub_result;
	
	LOAD	loadA (A, bus, ldA, clk);
	LOAD	loadB (B, bus, ldB, clk);
	MUX		mux_bus(bus, sel_in, data, sub_result);
	MUX		mux1 (X,sel1, A, B);
	MUX		mux2 (Y, sel2, A, B);
	COMPARATOR comp(gt, lt, eq, A, B);
	SUBTRACTOR sub(sub_result, X, Y);
	
endmodule