module inputShiftRegister(clk, data, outputData); 
	input  clk,data; 
	output [7:0] outputData; 
	logic [7:0] tmp; 
	
	always @(posedge clk) 
		begin
			tmp = {tmp[6:0], data}; 
		end 
	assign outputData = tmp; 
endmodule