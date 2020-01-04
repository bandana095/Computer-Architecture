`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:49:06 08/22/2019 
// Design Name: 
// Module Name:    ripple_carry_adder_subtractor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ripple_carry_adder_subtractor(input [3:0] A, input [3:0] B, input Op, output [3:0] S, output  C);

		// Write your ripple carry adder subtractor code here
		wire C1;
		wire C2;
		wire C3;
		full_adder f0(S[0],C1,A[0],B[0]^Op,Op);
		full_adder f1(S[1],C2,A[1],B[1]^Op,C1);
		full_adder f2(S[2],C3,A[2],B[2]^Op,C2);
		full_adder f3(S[3],C,A[3],B[3]^Op,C3);

endmodule 

module full_adder(output S, output Cout, input A, input B, input Cin);
	
		// Write your full adder code here
		assign S = (A^B)^Cin;
	    assign	Cout = (A&B)+(Cin&(A^B));

endmodule 

module rcas_test;

	reg [3:0] A;
	reg [3:0] B;
        reg Op;
	wire [3:0] S;
	wire C;
	
	// Instantiate the Unit Under Test (UUT)
	ripple_carry_adder_subtractor uut ( A, B, Op,S, C);
	
	initial begin
		A=4'b0011 ; 
		B=4'b0010 ;
		Op=0;
		#10 A=4'b1111; B=4'b1111; Op=0;
		#10 A=4'b1100; B=4'b0100; Op=1;  
		#10 A=4'b0011; B=4'b1010; Op=1;
		#10 A=4'b0100; B=4'b1100; Op=0; 
		#10 $finish;
	end    
endmodule
