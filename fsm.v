`define IDLE 3'b000
`define START 3'b001
`define PAUZA 3'b010
`define STOP 3'b011
`define RESET 3'b100

module fsm //#(parameter ADDR_SIZE=4)
(input clk, input reset, input validare_fsm, input [2:0] optiune, 
//input valid_sw,
output fsm_reset,output valid
//output [ADDR_SIZE-1:0] addr,
//output wr_en,

//output [ADDR_SIZE-1:0] addr2,
//output wr_en2
);

reg [2:0] state_reg,state_next;
reg valid_reg, fsm_reset_reg;
reg valid_next, fsm_reset_next;
reg validare_fsm_reg, validare_fsm_next;

/*reg [ADDR_SIZE-1:0] addr_reg, addr_next;
reg wr_en_reg, wr_en_next;

reg [ADDR_SIZE-1:0] addr2_reg, addr2_next;
reg wr_en2_reg, wr_en2_next;*/

always @(posedge clk or posedge reset) begin
	if(reset) begin
		state_reg <= `RESET;
		valid_reg <= 1'b0;
		fsm_reset_reg <= 1'b0;
		validare_fsm_reg <= 1'b1;
		/*addr_reg <= 0;
		wr_en_reg <= 0;
		addr2_reg <= 0;
		wr_en2_reg <= 0;*/
	end
	else begin
		state_reg <= state_next;
		valid_reg <= valid_next;
		fsm_reset_reg <= fsm_reset_next;
		validare_fsm_reg <= validare_fsm_next;
		/*addr_reg <= addr_next;
		wr_en_reg <= wr_en_next;
		addr2_reg <= addr2_next;
		wr_en2_reg <= wr_en2_next;*/
	end
	
end

always @* begin 
	state_next = state_reg;
	valid_next = valid_reg;
	fsm_reset_next = fsm_reset_reg;
	validare_fsm_next = validare_fsm;
	/*addr_next = addr_reg;
	wr_en_next = wr_en_reg;
	addr2_next = addr2_reg;
	wr_en2_next = wr_en2_reg;*/
	case(state_reg)
	
		`RESET:	begin
			valid_next = 1'b0;
			fsm_reset_next = 1'b0;
			state_next = `IDLE;
		end
		`IDLE: begin
			//wr_en2_next=1'b0;
			if((validare_fsm_reg ^ validare_fsm) & (!validare_fsm)) begin 
			case(optiune)
				`START: state_next = `START;
				`PAUZA: state_next = `PAUZA;
				`STOP: state_next = `STOP;
			endcase
			end
		end
		`START: begin
			valid_next = 1'b1;
			fsm_reset_next = 1'b0;
			/*wr_en_next = 1'b0;
			addr2_next = addr2_reg+1;
			wr_en2_next = 1'b1;*/
			state_next = `IDLE;
		end
		`PAUZA: begin
			//addr_next = addr_reg + 1;
			valid_next = 1'b0;
			fsm_reset_next = 1'b0;
			/*wr_en_next = 1'b1;
			addr2_next = addr2_reg+1;
			wr_en2_next = 1'b1;*/
			state_next = `IDLE;
		end
		`STOP: begin
			valid_next = 1'b0;
			fsm_reset_next = 1'b1;
			/*wr_en_next = 1'b0;
			addr2_next = addr2_reg+1;
			wr_en2_next = 1'b1;*/
			state_next = `IDLE;
		end
	
	endcase
	
	

end

assign fsm_reset=fsm_reset_reg;
assign valid=valid_reg;
/*assign addr=addr_reg;
assign wr_en=wr_en_reg;
assign addr2=addr2_reg;
assign wr_en2=wr_en2_reg;*/
  
endmodule 
