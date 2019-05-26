module counterclk #(parameter N =4) (input logic clk,
		input logic reset,
		output logic [N-1:0] q,
		output logic lastBit);
	
	always_ff @(posedge clk, posedge reset)
		if(reset) q<=0;
		else
			begin 
			q = q+1;
			lastBit = q[N-1];
			end
endmodule