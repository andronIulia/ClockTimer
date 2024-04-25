module sram #(parameter DATA_SIZE=8,parameter ADDR_SIZE=4)
(input clk,en, input [DATA_SIZE-1:0] wr_data,
input [ADDR_SIZE-1:0] addr,
output reg [DATA_SIZE-1:0] rd_data);

reg [DATA_SIZE-1:0] mem [2**ADDR_SIZE-1:0];

always @(posedge clk) begin
    rd_data<=mem[addr];  
	if(wr_en)
        mem[addr]<=wr_data;
end

always @* begin
    
end

endmodule
