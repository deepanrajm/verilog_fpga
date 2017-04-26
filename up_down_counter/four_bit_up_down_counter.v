module four_bit_up_down_counter(qn,tin,clock,clear,display,display1);
output [3:0]qn;
wire [3:0]qn;
output [6:0]display;
output [6:0]display1;
input tin;
input clock;
input clear;
t_flipflop tt1(qn[0],tin,clock,clear);
t_flipflop tt2(qn[1],tin,qn[0],clear);
t_flipflop tt3(qn[2],tin,qn[1],clear);
t_flipflop tt4(qn[3],tin,qn[2],clear);
seven_segment ss1(qn,display);
seven_segment_disp_two ss2(qn,display1);
endmodule
