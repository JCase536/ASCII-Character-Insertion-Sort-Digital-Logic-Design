
module test_sort;
	reg St, CLK;
	reg [31:0] arr;
	wire [31:0] out;
	sort s (St, CLK, arr, out);
	initial begin
		CLK <= 0;
		St <= 0;
		arr[31:24] <= 8'd167;
		arr[23:16] <= 8'd120;
		arr[15:8] <= 8'd24;
		arr[7:0] <= 8'd143;
		#1000;

		St <= 1;
		#1000;

		St <= 0;		
	end
	always begin
		#50 CLK <= ~CLK;
	end
endmodule