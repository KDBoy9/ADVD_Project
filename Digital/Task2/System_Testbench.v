`include "System.v"
`timescale 1s/1ms
module System_Testbench ;

reg RESET_Button , ZERO_Button , ONE_Button ;
wire UNLOCK_Output ;

system lock_combination( RESET_Button , ZERO_Button , ONE_Button , UNLOCK_Output ) ;

initial 
begin
	$dumpfile("System_Testbench.vcd");
	$dumpvars;
	ZERO_Button = 0 ;
	ONE_Button = 0 ;
	RESET_Button = 1 ;
	#2.5 RESET_Button = 0;

	#5 ZERO_Button = 1 ;
	#5 ZERO_Button = 0 ;

	#5 ONE_Button = 1 ;
	#5 ONE_Button = 0 ;

	#5 ZERO_Button = 1 ;
	#5 ZERO_Button = 0 ;

	#5 ONE_Button = 1 ;
	#5 ONE_Button = 0 ;

	#5 ONE_Button = 1 ;
	#5 ONE_Button = 0 ;

	#5 ZERO_Button = 1 ;
	#5 ZERO_Button = 0 ;
	$finish ;
end


endmodule
