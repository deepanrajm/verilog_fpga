module counter (out, clear, control);
input clear, control;
output [1:0]out;
reg [1:0]out;
always @ (*)
if (clear == 1 && control == 0)
 out=0;
else 
 out=out+1;
endmodule 