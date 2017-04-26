module Multiplier(product,a,b,clock);
input [7:0]a,b;
input clock;
output [15:0] product;
Booth_Multiply bm1 (product,a,b,clock);
endmodule

						