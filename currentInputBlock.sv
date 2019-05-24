module currentInput(
	input logic clk,
	input logic reset,
	input logic [7:0] newData,
	output logic [7:0] currData);

always_ff@(posedge clk, posedge reset)
begin
	if(reset) currData <= 0;
	else currData <= newData;
end

endmodule // currentInput