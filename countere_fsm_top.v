`timescale 1ns / 1ps
`include "countere_cascadate.v"
`include "fsm.v"

module countere_top(input clk,rst,input [2:0] optiune_user, input validare_fsm, input switch,
//output [3:0] out1, out3, output [2:0] out2, out4,
//output [3:0] outt1, outt3, output [2:0] outt2, outt4,
//output [13:0] rez,
//output [3:0] addr,
//output wr_en,
//output [3:0] addr2,
//output wr_en2,
//output [2:0] rez2
output valid, fsm_reset,
output [2:0] optiune
);

//wire [3:0] address,address2;

wire [2:0] optiune_rom;
wire validare_final;
wire valid_clk;
wire [3:0] addr;

clk_div #(.width(19),.MAX(500000)) divizor2_50MHz_100Hz(.clk(clk),.rst(rst),.en(1'b1),.div_clk(valid_clk));

counter#(.width(4),.MAX(15)) counter_rom(.clk(valid_clk),.rst(rst),.en(switch),.count_out(addr),.carry_out(carry_out));

rom #(.DATA_SIZE(3), .ADDR_SIZE(4)) rom1(.clk(clk),.rst(rst),.valid(switch),.addr(addr),.rd_data(optiune_rom));

assign optiune = switch ? optiune_rom : optiune_user;

assign validare_final = switch ? valid_clk : validare_fsm;

fsm fsm1(.clk(valid_clk),.reset(rst),.validare_fsm(validare_final),.optiune(optiune),.valid(valid),.fsm_reset(fsm_reset));

//wire valid_c,fsm_reset_c;

//assign valid_c=valid;
//assign fsm_reset_c=fsm_reset;

//countere_cascadate countere(.clk(clk), .rst(rst), .valid(valid_c), .fsm_reset(fsm_reset_c),.out1(outt1),.out2(outt2),.out3(outt3),.out4(outt4));

//sram #(.ADDR_SIZE(4), .DATA_SIZE(14)) sram1(.clk(clk),.wr_en(wr_en),.addr(addr), .wr_data({outt1,outt2,outt3,outt4}), .rd_data(rez));
//sram #(.ADDR_SIZE(4), .DATA_SIZE(3)) sram2(.clk(clk),.wr_en(wr_en2),.addr(addr2),.wr_data(optiune),.rd_data(rez2));


endmodule
