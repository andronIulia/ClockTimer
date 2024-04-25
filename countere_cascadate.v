`include "counter.v"

module countere_cascadate
(input clk, rst, input valid, input fsm_reset, output [3:0] out1, out3, output [2:0] out2, out4);

  	wire en_carry,en_carry2,en_carry3,en3,en4,en_carry4,reset,valid2,valid3,valid4;


    assign reset=rst | fsm_reset;
    //assign valid1=1'b1&valid;

    counter#(.width(4),.MAX(10)) counter_us(.clk(clk),.rst(reset),.en(valid),.count_out(out1),.carry_out(en_carry));

    assign valid2=en_carry&valid;
  
    counter#(.width(3),.MAX(6)) counter_zs(.clk(clk),.rst(reset),.en(valid2),.count_out(out2),.carry_out(en_carry2));
  
  	assign en3=en_carry & en_carry2;
    assign valid3=en3&valid;

    counter#(.width(4),.MAX(10)) counter_um(.clk(clk),.rst(reset),.en(valid3),.count_out(out3),.carry_out(en_carry3));
  
  	assign en4=en_carry&en_carry2&en_carry3;
    assign valid4=en4&valid;

    counter#(.width(3),.MAX(6)) counter_zm(.clk(clk),.rst(reset),.en(valid4),.count_out(out4),.carry_out(en_carry4));

endmodule
