module inputShiftRegister(input logic clk, 
	input logic data,
	input logic reset,
	output logic [7:0] pressedButtons, 
	output logic fullReg, output logic [3:0] cycleState); 

//	logic [3:0] cycleState;
	logic [3:0] nextState;

	//State Register
	
	always_ff@(posedge clk, posedge reset)
	begin
		if (reset) cycleState <= 0;
		else cycleState <= nextState;
	end

	//next state logic
	always_comb 
	begin
		case(cycleState)
			0: nextState <= 1; //Setup Blank
			1: nextState <= 2; //Latch
			2: nextState <= 3; //Blank
			3: nextState <= 4; //Start clock
			4: nextState <= 5;
			5: nextState <= 6;
			6: nextState <= 7;
			7: nextState <= 8;
			8: nextState <= 9;
			9: nextState <= 10;
			10: nextState <= 0;
			default: nextState <= 0;
				
		endcase // cycleState
	end

	
	always @(negedge clk) 
		begin
			
			if(cycleState == 10) fullReg = 1;
			else fullReg = 0;
			
			if(cycleState != 0 &&cycleState != 1 && cycleState !=10)
					pressedButtons = {pressedButtons[6:0], data}; 
		end  

endmodule