//`include "countere_fsm_top.v"
`timescale 1ns / 1ps
`include "top.v"

module top_tb();
reg rst,clk;
reg valid;
reg [2:0]optiune;
//wire [2:0]out2,out4;
//wire [3:0]out1,out3;
wire [3:0] outt1, outt3;
wire [2:0] outt2, outt4;
wire [3:0] addr;
wire [13:0] rez;
wire wr_en;
wire [3:0] addr2;
wire [2:0] rez2;
wire wr_en2;
  
  //top countertop(.clk(clk), .rst(rst),.optiune(optiune), .buton(valid),.display1(out1), .display2(out2), .display3(out3), .display4(out4));

countere_top top2(.clk(clk), .rst(rst),.optiune(optiune),.validare_fsm(valid),
// .out1(out1),.out2(out2),.out3(out3),.out4(out4),
.rez(rez),.wr_en(wr_en),
.addr2(addr2),.wr_en2(wr_en2),.rez2(rez2),
.addr(addr),.outt1(outt1), .outt2(outt2), .outt3(outt3), .outt4(outt4));

initial begin
clk = 1'b0;

forever #1 clk = !clk;
end

initial begin

    rst = 1'b1;
    valid = 1'b1;
    optiune = 3'b000;
  	
  //#2000; 2000ns
  	//repeat(1000) @(posedge clk); 
  	#100
    rst = 1'b0;
    #1000;

    optiune = 3'b001;
    //#2000;
  repeat(1000) @(posedge clk); 
    valid = 1'b0;
    #2000;
    valid = 1'b1;
    #1000;

    //rst = 1'b1;

    optiune = 3'b000;
    //#2000;
  repeat(1000) @(posedge clk); 
    valid = 1'b0;
    #2000;
    valid = 1'b1;
    #1000;
    
  	optiune = 3'b011;
    //#1000;
  repeat(100) @(posedge clk); 
  	optiune = 3'b100;
  //#1000;
  repeat(1000) @(posedge clk); 
  	optiune = 3'b110;
  //#1000;
  repeat(1000) @(posedge clk); 
  	optiune = 3'b010;
  //#1000;
  repeat(1000) @(posedge clk); 
  
  	optiune = 3'b000;
  //#2000;
  repeat(1000) @(posedge clk); 
    valid = 1'b0;
    #2000;
    valid = 1'b1; 
    #1000;

    optiune = 3'b010;
    //#2000;
  repeat(100) @(posedge clk); 
    valid = 1'b0;
   	#2000;
    valid = 1'b1;
    #1000;
  
  	optiune = 3'b000;
  //#1000;
  repeat(1000) @(posedge clk); 
    optiune = 3'b011;
    #2000;
    valid = 1'b0;
    #2000;
    valid = 1'b1;
  //#1000;
  repeat(1000) @(posedge clk); 

  repeat(24) #20000;
$finish();
end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule
