module clk_div#(parameter width = 4,
                parameter MAX = 10)
  			   (input clk,input rst,input en, output div_clk);
  
  localparam HALD_COUNT = (MAX-1)/2;
  reg [width-1:0] count_ff,count_next;
  reg drive_ff, drive_next;
  
  assign div_clk = drive_ff;
  
  
  always @* begin
    drive_next = drive_ff;
    count_next = count_ff;
    if(en) begin
      if(count_ff == (MAX-1)) begin
        drive_next = 1'b0;
        count_next = 'b0;
      end else begin
        count_next = count_ff+1'b1;
        if(count_ff < HALD_COUNT) begin
          drive_next = 1'b0;
        end else begin
          drive_next = 1'b1;
        end
      end
    end
  end
  

  always @(posedge clk or posedge rst) begin
    if(rst) begin
      drive_ff <= 1'b0;
      count_ff <= 'b0;  
    end else begin
      drive_ff <= drive_next;
      count_ff <= count_next;
    end
  end
endmodule
