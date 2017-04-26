/////////////////////////////////////////////////
// MEALY MACHINE
// * Output depends on present state and inputs
// * A program to detect a pair of 1's or 0's 
// 	 in an infinite input code
////////////////////////////////////////////////

module Mealy_Machine(clock, reset, x, y);
input clock, reset, x;
output y;
reg [1:0] state;
reg y;

// Register Logic
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// Next State and Output Logic
always @(posedge clock, posedge reset) 
	begin
		if(reset) 
			begin
				state <= S0;
				y <= 0;
			end
		else  
			begin
			   case(state)
					S0: 
						begin
							if(x) 
								begin
									state <= S1;
									y  <= 0;
								end
							else 
								begin
								state <= S2;
								y <= 0;
								end
						end
					S1: 
						begin
							if(x) 
								begin
									state <= S0;
									y  <= 1;
							end
							else  
								begin
								   state <= S2;
								   y <= 0;
							end
					   end
					S2: 
						begin
							if(x) 
								begin
									state <= S1;
									y  <= 0;
							end
							else 
								begin
								   state <= S0;
								   y <= 1;
							end
						end
					default: 
						begin
							state <= S0;
							y <= 0;
						end
			endcase
		end
	end
endmodule
