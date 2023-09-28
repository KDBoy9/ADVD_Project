`include "MUX8_to_1.v"
`include "DFF.v"
`timescale 1s/1ms
module system( RESET_Button , ZERO_Button , ONE_Button , UNLOCK_Output );

input RESET_Button , ZERO_Button , ONE_Button ;
output UNLOCK_Output ;

wire clk , clr_bar ;
reg pre_bar ;
wire dff_0_Q , dff_0_Q_Bar , dff_0_D ;
wire dff_1_Q , dff_1_Q_Bar , dff_1_D ;
wire dff_2_Q , dff_2_Q_Bar , dff_2_D ;


//assign #0.1 clk = mux_7_out ;

dff dff_0( dff_0_Q , dff_0_Q_Bar , dff_0_D , clk , clr_bar , pre_bar );
dff dff_1( dff_1_Q , dff_1_Q_Bar , dff_1_D , clk , clr_bar , pre_bar );
dff dff_2( dff_2_Q , dff_2_Q_Bar , dff_2_D , clk , clr_bar , pre_bar );

wire [7:0] mux_0_in ;
wire [2:0] mux_0_s ;
wire mux_0_out ;
wire mux_0_en_bar ;

wire [7:0] mux_1_in ;
wire [2:0] mux_1_s ;
wire mux_1_out ;
wire mux_1_en_bar ;

wire [7:0] mux_2_in ;
wire [2:0] mux_2_s ;
wire mux_2_out ;
wire mux_2_en_bar ;

wire [7:0] mux_4_in ;
wire [2:0] mux_4_s ;
wire mux_4_out ;
wire mux_4_en_bar ;

wire [7:0] mux_5_in ;
wire [2:0] mux_5_s ;
wire mux_5_out ;
wire mux_5_en_bar ;

wire [7:0] mux_6_in ;
wire [2:0] mux_6_s ;
wire mux_6_out ;
wire mux_6_en_bar ;

wire [7:0] mux_7_in ;
wire [2:0] mux_7_s ;
wire mux_7_out ;
wire mux_7_en_bar ;

assign #0.1 clk = mux_7_out ;

reg mux_6_S_2 ;

mux8_to_1 mux_0( mux_0_in , mux_0_out , mux_0_s , mux_0_en_bar ) ;
mux8_to_1 mux_1( mux_1_in , mux_1_out , mux_1_s , mux_1_en_bar ) ;
mux8_to_1 mux_2( mux_2_in , mux_2_out , mux_2_s , mux_2_en_bar ) ;
mux8_to_1 mux_4( mux_4_in , mux_4_out , mux_4_s , mux_4_en_bar ) ;
mux8_to_1 mux_5( mux_5_in , mux_5_out , mux_5_s , mux_5_en_bar ) ;
mux8_to_1 mux_6( mux_6_in , mux_6_out , mux_6_s , mux_6_en_bar ) ;
mux8_to_1 mux_7( mux_7_in , mux_7_out , mux_7_s , mux_7_en_bar ) ;


assign mux_0_in = { 1'b0 , 1'b0 , dff_1_Q , 1'b0 , 1'b0 , 1'b0 , dff_2_Q , dff_2_Q } ;
assign mux_1_in = { 1'b0 , 1'b0 , 1'b0 , dff_2_Q_Bar , 1'b0 , dff_2_Q_Bar , dff_2_Q , 1'b0 } ;
assign mux_2_in = { 1'b0 , mux_4_out , 1'b0 , ZERO_Button , dff_2_Q_Bar , 1'b0 , 1'b0 , 1'b0 } ;
assign mux_4_in = { 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b1 } ;
assign mux_5_in = { 1'b0 , 1'b0 , 1'b1 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 } ;
assign mux_6_in = { 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b0 , 1'b1 } ;
assign mux_7_in = { 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b1 , 1'b0 } ;

assign mux_0_s = { dff_0_Q , ZERO_Button , ONE_Button } ;
assign mux_1_s = { dff_0_Q , ZERO_Button , ONE_Button } ;
assign mux_2_s = { dff_1_Q , dff_0_Q , ONE_Button } ;
assign mux_4_s = { 1'b0 , 1'b0 , ZERO_Button } ;
assign mux_5_s = { dff_2_Q , dff_1_Q , dff_0_Q } ;
assign mux_6_s = { mux_6_S_2 , 1'b0 , RESET_Button } ;
assign mux_7_s = { 1'b0 , ZERO_Button , ONE_Button } ;


assign mux_0_en_bar = 0 ;
assign mux_1_en_bar = 0 ;
assign mux_2_en_bar = 0 ;
assign mux_4_en_bar = 0 ;
assign mux_5_en_bar = 0 ;
assign mux_6_en_bar = 0 ;
assign mux_7_en_bar = 0 ;

assign dff_2_D = mux_0_out ;
assign dff_0_D = mux_1_out ;
assign dff_1_D = mux_2_out ;
assign UNLOCK_Output = mux_5_out ;

assign clr_bar = mux_6_out ;

initial begin
	mux_6_S_2 = 1'b1 ;
	pre_bar = 1'b1 ;
	mux_6_S_2 = 1'b0 ;
end	

endmodule
