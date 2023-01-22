
module bit_select(input reg St, CLK, input reg [7:0] X, Y, output R, x, y);
	reg D2, D1, D0;
	reg [7:0] XC, YC;
	assign R = D2&~D1&~D0;
	assign x = XC[7];
	assign y = YC[7];
	initial begin
		XC <= 8'h0;
		YC <= 8'h0;
		D2 <= 1;
		D1 <= 0;
		D0 <= 0;
	end
	always @(posedge CLK) begin
		if(~D2|D1|D0) begin
			XC <= XC << 1;
			YC <= YC << 1;
		end
		else if(St) begin
			XC <= X;
			YC <= Y;
		end
		D2 <= (D1&~D0) | (D2&D0) | (~St&D2);
		D1 <= (D1&~D0) | (~D2&D0);
		D0 <= (D2&D1) | (~D2&~D1);
	end
endmodule
