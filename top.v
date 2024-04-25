`timescale 1ns / 1ps
`include "display_hexa.v"
`include "countere_cascadate.v"
`include "clk_div.v"
`include "fsm.v"
`include "debounce.v"

module top(input clk, rst,buton,input [2:0] optiune,
 output [6:0] display1, display2, display3, display4);
    wire [3:0] out1, out3;
	wire [2:0] out2, out4;
	wire new_clk, deb_clk;
	wire valid_c,fsm_reset_c;
	wire buton_valid;

  	clk_div#(.width(13),.MAX(5000)) divizor_50MHz_1Hz(.clk(clk),.rst(rst),.en(1'b1),.div_clk(new_clk));

	clk_div#(.width(19),.MAX(500000)) divizor_50MHz_100Hz(.clk(clk),.rst(rst),.en(1'b1),.div_clk(deb_clk));

	debounce deb(.clk(deb_clk),.rst(rst),.d(buton),.q(buton_valid));

	fsm fsm1(.clk(deb_clk),.reset(rst),.validare_fsm(buton_valid),.optiune(optiune),.valid(valid_c),.fsm_reset(fsm_reset_c));

  	//countere_cascadate countere(.clk(new_clk), .rst(rst), .valid(valid_c), .fsm_reset(fsm_reset_c),.out1(out1),.out2(out2),.out3(out3),.out4(out4));
	countere_cascadate countere(.clk(new_clk), .rst(rst), .valid(valid_c), .fsm_reset(fsm_reset_c),.out1(out1),.out2(out2),.out3(out3),.out4(out4));

    	display_hexa hex1(.count_out(out1), .display(display1));
    	display_hexa hex2(.count_out(out2), .display(display2));
    	display_hexa hex3(.count_out(out3), .display(display3));
    	display_hexa hex4(.count_out(out4), .display(display4));

endmodule

