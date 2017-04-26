module Booth_Multiply(product,a,b,clock);
output reg [15:0]product;
input [7:0]a,b;
reg [7:0]a1,b1;
input clock;
reg [15:0] answer;

integer i;
integer operate;

initial
	begin
		product = 16'b0;
		answer  = 16'b0;
	end
	
always @(*)
	begin
		if(a[7]==1'b1)
			a1 = ~a + 1;
		else
			begin
				a1 = a;
				b1 = b;
			end
	end
	
always @ (negedge clock)
	begin 
		product = 16'b0;
		
		// This loop runs four times for values i = 1,3,5,7
		for(i=1;i<=7;i=i+2)
			begin
				if(i==1) // only for first three bits and i=1
					operate = b1[0]-b1[1]-b1[1];
					
				else // for other bits and i= 3,5,7
					operate = b1[i-1]+b1[i-2]-b1[i]-b1[i];
					
				// According to 4 values of operate. (1,2,-1,-2)
				case(operate)
					1:
						begin
							answer  = a1;
							answer  = answer << (i-1);
							product = product + answer;
						end
					2:
						begin
							answer  = a1 << 1;
							answer  = answer << (i-1);
							product = product + answer;
						end
					-1:
						begin
							answer  = ~a1+1;
							answer  = answer << (i-1);
							product = product + answer;
						end
					-2:
						begin
							answer  = a1 << 1;
							answer  = ~answer + 1;
							answer  = answer << (i-1);
							product = product + answer;
						end
				endcase
			end
		if(a[7]==1'b1)
			product = ~product +1;
	end
endmodule
						