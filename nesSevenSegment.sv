module nesSevenSegment(
	input logic clk,
	input logic reset,
	input logic nesData,

	output logic nesLatchWire,
	output logic nesClk,
	output logic [7:0] sevenSeg
	);
//logic clk;
logic regFull;
logic [7:0] pressedButtons;

nesClockBlock nesClock(
	.clk(clk),
	.reset(reset),
	.nesClk(nesClk));

nesLatchBlock nesLatch(
	.clk(clk),
	.reset(reset),
	.nesLatch(nesLatchWire));

inputShiftRegister inputRegister(
	.clk(clk),
	.data(nesData),
	.reset(reset),
	.pressedButtons(pressedButtons),
	.fullReg(regFull));

currentInput storeButtons(
	.clk(regFull),
	.reset(reset),
	.newData(pressedButtons),
	.currData(sevenSeg));
//
//counterclk clkDiv(
//	.clk(masterClk),
//	.reset(reset),
//	.lastBit(clk));
endmodule