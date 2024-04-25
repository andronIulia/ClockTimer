//`include "countere_fsm_top.v"
`timescale 1ns / 1ps

module fsm_rom_tb();
reg rst,clk;
reg validare_fsm;
reg [2:0]optiune_user;
reg switch;
wire valid;
wire fsm_reset;
wire [2:0] optiune;


countere_top top2(.clk(clk), .rst(rst),.optiune_user(optiune_user),.validare_fsm(validare_fsm),.switch(switch)
,.valid(valid),.fsm_reset(fsm_reset),.optiune(optiune));

initial begin
clk = 1'b0;

forever #1 clk = !clk;
end

initial begin

    rst = 1'b1;
    validare_fsm = 1'b1;
    //validare_rom = 1'b1;
    optiune_user = 3'b000;
    switch = 0;
  	
  //#2000; 2000ns
  	//repeat(1000) @(posedge clk); 
  	#100
    rst = 1'b0;
    #1000;

    optiune_user = 3'b001;
    //#2000;
  repeat(1000) @(posedge clk); 
    validare_fsm = 1'b0;
    #2000;
    validare_fsm = 1'b1;
    #1000;

    //rst = 1'b1;

    optiune_user = 3'b000;
    //#2000;
  repeat(1000) @(posedge clk); 
    validare_fsm = 1'b0;
    #2000;
    validare_fsm = 1'b1;
    #1000;
    
  	optiune_user = 3'b011;
    //#1000;
  repeat(100) @(posedge clk); 
  	optiune_user = 3'b100;
  //#1000;
  repeat(1000) @(posedge clk); 
  	optiune_user = 3'b110;
  //#1000;
  repeat(1000) @(posedge clk); 
  	optiune_user = 3'b010;
  //#1000;
  repeat(1000) @(posedge clk); 
  
  	optiune_user = 3'b000;
  //#2000;
  repeat(1000) @(posedge clk); 
    validare_fsm = 1'b0;
    #2000;
    validare_fsm = 1'b1; 
    #1000;

    optiune_user = 3'b010;
    //#2000;
  repeat(100) @(posedge clk); 
    validare_fsm = 1'b0;
   	#2000;
    validare_fsm = 1'b1;
    #1000;
  
  	optiune_user = 3'b000;
  //#1000;
  repeat(1000) @(posedge clk); 
    optiune_user = 3'b011;
    #2000;
    validare_fsm = 1'b0;
    #2000;
    validare_fsm = 1'b1;
  //#1000;
  repeat(1000) @(posedge clk); 


  switch = 1'b1;
  //validare_rom = 1'b0;
  #100;
  repeat(10000) @(posedge clk);
  
$finish();
end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule

