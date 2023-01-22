

module sort(input reg sortSt, CLK, input reg [31:0] in, output [31:0] out);
	reg CLK2, CLK4, CLK8;
	reg compSt;
	reg [7:0] X, Y, swap;
	reg [31:0] temp;
	wire [1:0] C;
	wire G;
	assign out = temp;
	sort_step_select sort_select (sortSt, CLK8, C);
	comparator comp (compSt, CLK, X, Y, G);
	initial begin
		compSt <= 0;
		CLK2 <= 0;
		CLK4 <= 0;
		CLK8 <= 0;
		X <= in[31:24];
		Y <= in[23:16];
	end
	always @(posedge CLK) begin
		CLK2 <= ~CLK2;
	end
	always @(posedge CLK2) begin
		CLK4 <= ~CLK4;
	end
	always @(posedge CLK4) begin
		CLK8 <= ~CLK8;
	end
	always @(posedge CLK8) begin
		case(C)
			2'd0: begin
				temp <= in;
				X <= in[31:24];
				Y <= in[23:16];
				if(sortSt) begin
					compSt <= 1;
				end
				else begin
					compSt <= 0;
				end
			end
			2'd1: begin
				if(G) begin
					temp[31:24] <= temp[23:16];
					temp[23:16] <= temp[31:24];
				end
				X <= temp[31:24];
				Y <= temp[23:16];
			end
			2'd2: begin
				if(G) begin
					temp[23:16] <= temp[15:8];
					temp[15:8] <= temp[23:16];
				end
				X <= temp[23:16];
				Y <= temp[15:8];
			end
			2'd3: begin
				if(G) begin
					temp[15:8] <= temp[7:0];
					temp[7:0] <= temp[15:8];
				end
				X <= temp[15:8];
				Y <= temp[7:0];
			end
		endcase
	end
endmodule