module nesDecoder(
	input logic clk,
	input logic reset, 
	//Controller connection
	input logic nesData,
	output logic nesLatch,
	output logic nesDataClk,
	//Data ouput
	output logic A,
	output logic B,
	output logic select,
	output logic start,
	output logic up,
	output logic down,
	output logic left,
	output logic right
	);

	logic [3:0] cycleState;
	
	always_comb
	begin
		if(cycleState >= 3 && cycleState <= 10) nesDataClk = clk;
		else nesDataClk = 0;
	end
	

	always_ff @(posedge clk, posedge reset)
	begin
		if(reset) 
		begin
			cycleState <= 0;	
			A <= 0;
			B <= 0;
			select <= 0;
			start <= 0;
			up <= 0;
			down <= 0;
			left <= 0;
			right <= 0;
			nesLatch <= 0;
		end 
		else
		begin
			case(cycleState)
					0: begin nesLatch <= 1; A <= !nesData; end
					1: nesLatch <= 0;
					2:  B <= !nesData;
					3: select<= !nesData;
					4: start <= !nesData;
					5: up <= !nesData;
					6: down <= !nesData;
					7: left <= !nesData;
					8: right <= !nesData;
					default: begin cycleState <= 15; end
			endcase

				cycleState <= cycleState + 1;
		end
		
	end



endmodule // nesDecoder
