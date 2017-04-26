module Moore_Machine(clock, reset, x, y);
input clock, reset, x;
output y;
reg [1:0] state;
reg y;
always @ (posedge clock, posedge reset)
	begin
		if(reset) state <= 2'b00;
		else 
			begin
				case(state)
					2'b00: 	begin
								if(x) state <= 2'b01;
								else state <= 2'b10;
							end
					2'b01: 	begin
								if(x) state <= 2'b11;
								else state <= 2'b10;
							end
					2'b10:  begin
								if(x) state <= 2'b01;
								else state <= 2'b11;
							end
					2'b11:  begin
								if(x) state <= 2'b01;
								else state <= 2'b10;
							end
				endcase	
			end
	end

always @(posedge clock, posedge reset)
	begin
		if(reset) 
			y <= 0;
		else if (state == 2'b11)
			y <= 1;
		else 
			y <= 0;
	end
endmodule
