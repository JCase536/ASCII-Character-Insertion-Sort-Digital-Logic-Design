
module sort_step_select(input reg St, CLK, output [1:0] C);
	reg D2, D1, D0;
	assign C[1] = D2;
	assign C[0] = ~D0 | (~D2&D1);
	initial begin
		D2 <= 0;
		D1 <= 0;
		D0 <= 1;
	end
	always @(posedge CLK) begin
		D2 <= ~D0;
		D1 <= (~D2&~D0) | (D2&D0);
		D0 <= (~St|D2|D1|~D0) & (~D2|~D1|~D0) & (D2|~D1|D0);
	end
endmodule