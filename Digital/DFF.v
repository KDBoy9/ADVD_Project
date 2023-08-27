module dff( q , q_bar , d , clk , clr_bar , pre_bar );

wire [3:0] y ;

output q , q_bar ;

input  d , clk , clr_bar , pre_bar ;

nand( y[0] , pre_bar , y[3] , y[1] ) ;
nand( y[1] , clr_bar , y[0] , clk ) ;
nand( y[2] , clk , y[1] , y[3] ) ;
nand( y[3] , d , y[2] , clr_bar ) ;

nand( q , q_bar , y[1] , pre_bar ) ;
nand( q_bar , q , clr_bar , y[2] ) ;

endmodule
