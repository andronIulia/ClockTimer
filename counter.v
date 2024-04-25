module counter#(parameter width = 4,
                parameter MAX = 10)
  			   (input clk,input rst,input en,output carry_out, output [width-1:0] count_out);

  reg [width-1:0] count_ff,count_next;
  reg carry_ff, carry_next;
  // this always bloc will be synthesize as combinational logic
  assign count_out=count_ff;
  assign carry_out=carry_ff;
  always @* begin
    count_next = count_ff;
    carry_next = carry_ff; 
    if(en) begin
      if(count_ff == (MAX-2)) begin
        carry_next='b1;
      end
      if(count_ff == (MAX-1)) begin
	carry_next='b0;
        count_next = 'b0;
      end else begin
        count_next = count_ff+1'b1;
      end
    end
  end
  
  // this always bloc will be synthesize as sequential logic
  always @(posedge clk or posedge rst) begin
    if(rst) begin
      count_ff <= 'b0;
      carry_ff<='b0;

  // if you don`t know the width use 'b0 and the compiler will insert 0 on all defined bits
    end else begin
      count_ff <= count_next;
      carry_ff <= carry_next;
    end
  end
endmodule
