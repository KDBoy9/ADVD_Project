module mux8_to_1 ( in , out , s , en_bar );

output out ;
input [7:0] in ;
input [2:0] s ;
input en_bar ;

wire out_before_z ;
wire [7:0] y ;
wire [2:0] sn ;

not( sn[0] , s[0] ) ;
not( sn[1] , s[1] ) ;
not( sn[2] , s[2] ) ;

and( y[0] , in[0] ,  sn[2] , sn[1] , sn[0] ) ;
and( y[1] , in[1] ,  sn[2] , sn[1] ,  s[0] ) ;
and( y[2] , in[2] ,  sn[2] ,  s[1] , sn[0] ) ;
and( y[3] , in[3] ,  sn[2] ,  s[1] ,  s[0] ) ;
and( y[4] , in[4] ,   s[2] , sn[1] , sn[0] ) ;
and( y[5] , in[5] ,   s[2] , sn[1] ,  s[0] ) ;
and( y[6] , in[6] ,   s[2] ,  s[1] , sn[0] ) ;
and( y[7] , in[7] ,   s[2] ,  s[1] ,  s[0] ) ;

or( out_before_z , y[0] , y[1] , y[2] , y[3] , y[4] , y[5] , y[6] , y[7] ) ;

bufif0( out , out_before_z , en_bar ) ;

endmodule
