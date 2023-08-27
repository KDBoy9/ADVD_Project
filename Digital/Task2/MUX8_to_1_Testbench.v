`include "MUX8_to_1.v"

module Testbench;

reg EN_BAR ;
reg [7:0] IN ;
reg [2:0] S ;

wire OUTPUT ;

mux8_to_1 mymux( IN , OUTPUT , S , EN_BAR ) ;

initial
begin

$dumpfile("MUX8_to_1_Testbench.vcd");
$dumpvars;

IN[0] = 1 ; IN[1] = 1 ; IN[2] = 0 ; IN[3] = 1 ; IN[4] = 0 ; IN[5] = 1 ; IN[6] = 0 ; IN[7] = 1 ;

EN_BAR = 1 ;

   S[2] = 0 ; S[1] = 0 ; S[0] = 0 ;
#5 S[2] = 0 ; S[1] = 0 ; S[0] = 1 ;
#5 S[2] = 0 ; S[1] = 1 ; S[0] = 0 ;
#5 S[2] = 0 ; S[1] = 1 ; S[0] = 1 ;
#5 S[2] = 1 ; S[1] = 0 ; S[0] = 0 ;
#5 S[2] = 1 ; S[1] = 0 ; S[0] = 1 ;
#5 S[2] = 1 ; S[1] = 1 ; S[0] = 0 ;
#5 S[2] = 1 ; S[1] = 1 ; S[0] = 1 ;
#5;

EN_BAR = 0 ;

   S[2] = 0 ; S[1] = 0 ; S[0] = 0 ;
#5 S[2] = 0 ; S[1] = 0 ; S[0] = 1 ;
#5 S[2] = 0 ; S[1] = 1 ; S[0] = 0 ;
#5 S[2] = 0 ; S[1] = 1 ; S[0] = 1 ;
#5 S[2] = 1 ; S[1] = 0 ; S[0] = 0 ;
#5 S[2] = 1 ; S[1] = 0 ; S[0] = 1 ;
#5 S[2] = 1 ; S[1] = 1 ; S[0] = 0 ;
#5 S[2] = 1 ; S[1] = 1 ; S[0] = 1 ;
#5;

end
endmodule
