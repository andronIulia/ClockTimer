
module rom #(parameter DATA_SIZE=3,parameter ADDR_SIZE=4)
(input clk,rst,valid,
input [ADDR_SIZE-1:0] addr, // de la counter
output [DATA_SIZE-1:0] rd_data);

localparam idle = 3'b000 ;
localparam start = 3'b001;
localparam pauza = 3'b010 ;
localparam stop  = 3'b011;

reg [DATA_SIZE-1:0] mem [2**ADDR_SIZE-1:0];
reg [DATA_SIZE-1:0] rd_data_reg, rd_data_next;

always @(posedge clk) begin
    if(rst) begin
        rd_data_reg <= 0;
        mem[0]=idle;
        mem[1]=start;
        mem[2]=pauza;
        mem[3]=idle;
        mem[4]=start;
        mem[5]=stop;
        mem[6]=start;
        mem[7]=pauza;
        mem[8]=stop;
        mem[9]=idle;
        mem[10]=start;
        mem[11]=idle;
        mem[12]=idle;
        mem[13]=stop;
        mem[14]=start;
        mem[15]=pauza;
    end
    else begin
        rd_data_reg <= rd_data_next;
    end
end

always @* begin
    rd_data_next = rd_data_reg;
    if(valid)
        rd_data_next = mem[addr];
end
assign rd_data = rd_data_reg;
endmodule
