module display_hexa#(parameter width=4)
  (input [width-1:0] count_out, output [6:0] display);
  reg [6:0] conversie_hexa;
  always @* begin
    case(count_out)
      4'd0: conversie_hexa <= 7'b1000000;
      4'd1: conversie_hexa <= 7'b1111001;
      4'd2: conversie_hexa <= 7'b0100100;
      4'd3: conversie_hexa <= 7'b0110000;
      4'd4: conversie_hexa <= 7'b0011001;
      4'd5: conversie_hexa <= 7'b0010010;
      4'd6: conversie_hexa <= 7'b0000010;
      4'd7: conversie_hexa <= 7'b1111000;
      4'd8: conversie_hexa <= 7'b0000000;
      4'd9: conversie_hexa <= 7'b0011000;
      default: conversie_hexa <= 7'b1111111;
    endcase
  end
  assign display=conversie_hexa;
endmodule
