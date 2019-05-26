module nesLatchBlock(input logic clk,
							input logic reset,
							output logic nesLatch
							);

	logic [3:0] cycleState;
	logic [3:0] nextState;
	//State Register
	
	always_ff@(posedge clk, posedge reset)
	begin
		if (reset) begin cycleState <= 0;end
		else		  cycleState <= nextState;
	end

	//next state logic
	always_comb 
	begin
		case(cycleState)
			0: nextState <= 1;
			1: nextState <= 2;
			2: nextState <= 3;
			3: nextState <= 4;
			4: nextState <= 5;
			5: nextState <= 6;
			6: nextState <= 7;
			7: nextState <= 8;
			8: nextState <= 9;
			9: nextState <= 0;
			default: nextState <= 0;
				
		endcase
	end
	
	//Output logic
	assign nesLatch = (cycleState == 0);

endmodule