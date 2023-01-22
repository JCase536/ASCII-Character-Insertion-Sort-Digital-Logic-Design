
module test_comparator;
	reg St, CLK;
	reg [7:0] X, Y;
	wire G;

	comparator comp (St, CLK, X, Y, G);

	initial begin
		X = 8'd167;
		Y = 8'd120;
		CLK = 0;
		St = 0;
		#200;

		St = 1;
		#300;

		St = 0;
	end

	always begin
		#50 CLK = ~CLK;
	end
endmodule

