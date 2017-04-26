module binary_to_decimal(clock, binary, decimal);
       input [15:0] binary;
	   input clock;

	   output reg [15:0] decimal = 0;

       reg [3:0] digit0, digit1, digit2, digit3;
       wire carry0, carry1, carry2;
       reg [4:0] counter =0;
              
       assign carry0=(digit0>4);
       assign carry1=(digit1>4);
       assign carry2=(digit2>4);

       always @(posedge clock) begin
              if (counter==0) begin
                     digit0<=0;
                     digit1<=0;
                     digit2<=0;
                     digit3<=0;
                     counter <= counter + 1;
              end
              
              else if (counter<17) begin
                if (carry0)
                           digit0<={digit0-5,binary[16-counter]};
                else
                           digit0<={digit0[2:0],binary[16-counter]};
              
                if (carry1)
                           digit1<={digit1-5,carry0};
                else
                           digit1<={digit1[2:0],carry0};
       
                if (carry2)
                           digit2<={digit2-5,carry1};
                else
                           digit2<={digit2[2:0],carry1};
       
                digit3<={digit3[2:0],carry2};
                counter <= counter + 1;
              end 
              
              else if (counter == 17 ) begin
                     if( binary < 10000 ) //check that the BCD input value is not exceeding 9999
                           decimal <= {digit3,digit2,digit1,digit0}; //if so force output always to 9999
                     else
                           decimal <= 16'h9999; //maximum value to be displayed Maybe should be 0xFFFF?
                           counter <= 0;
              end
       
       end

endmodule