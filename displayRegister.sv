module displayRegister(input logic clk, 
	input logic [7:0] data, 
	output logic [7:0]  sevenSeg); 

	logic [7:0] tmp; 
	logic [3:0] cycleState;
	logic [3:0] nextState;
	
	always @(posedge clk) 
		begin
			tmp = {tmp[6:0], data}; 
			if(cycleState == 10) fullReg = 1;
			else fullReg = 0;
		end  


endmodule