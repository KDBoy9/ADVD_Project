`include "DFF.v"
module Testbench;

reg D , PRE_BAR , CLR_BAR , REG , CLK ;

wire Q , Q_BAR ;

dff mydff( Q , Q_BAR , D , CLK , CLR_BAR , PRE_BAR );

initial
	CLK = 0 ;
always 
	#3 CLK = ~CLK ;
initial
	D = 0 ;
always
	#6 D = ~D ;

initial
begin 
	$dumpfile("DFF_Testbench.vcd");
	$dumpvars;
	PRE_BAR = 1 ;
	CLR_BAR = 0 ;
	#20 CLR_BAR = 1 ;
	#20 PRE_BAR = 0 ;
	#20 PRE_BAR = 1 ;
	#40 $finish;
end
endmodule

