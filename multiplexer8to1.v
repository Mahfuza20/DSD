/*
module multiplexer8_to_1(out,i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2);
input i0,i1,i2,i3,i4,i5,i6,i7;
input s0,s1,s2;
output out;

wire y0,y1,y2,y3,y4,y5,y6,y7;
wire s0b,s1b,s2b;

not(s0b,s0);
not(s1b,s1);
not(s2b,s2);

and(y0,i0,s0b,s1b,s2b);
and(y1,i1,s0b,s1b,s2);
and(y2,i2,s0b,s1,s2b);
and(y3,i3,s0b,s1,s2);
and(y4,i4,s0,s1b,s2b);
and(y5,i5,s0,s1b,s2);
and(y6,i6,s0,s1,s2b);
and(y7,i7,s0,s1,s2);

or(out,y0,y1,y2,y3,y4,y5,y6,y7);

endmodule
*/


module mux8to1 (out,i,s);
input [7:0]i;
input [2:0]s;
output out;

wire s0b,s1b,s2b;
wire y0,y1,y2,y3,y4,y5,y6,y7;

not(s0b,s[0]);
not(s1b,s[1]);
not(s2b,s[2]);

and(y0,i[0],s2b,s1b,s0b);
and(y1,i[1],s2b,s1b,s[0]);
and(y2,i[2],s2b,s[1],s0b);
and(y3,i[3],s2b,s[1],s[0]);
and(y4,i[4],s[2],s1b,s0b);
and(y5,i[5],s[2],s1b,s[0]);
and(y6,i[6],s[2],s[1],s0b);
and(y7,i[7],s[2],s[1],s[0]);
or(out,y0,y1,y2,y3,y4,y5,y6,y7);

endmodule

module mux8to1test;
reg [7:0]i;
reg [2:0]s;
wire out;
mux8to1 m81(out,i,s);
initial
begin

i=8'b 01010101;

     s[2]=0; s[1]=0; s[0]=0;
#100 s[2]=0; s[1]=0; s[0]=1;
#100 s[2]=0; s[1]=1; s[0]=0;
#100 s[2]=0; s[1]=1; s[0]=1;
#100 s[2]=1; s[1]=0; s[0]=0;
#100 s[2]=1; s[1]=0; s[0]=1;
#100 s[2]=1; s[1]=1; s[0]=0;
#100 s[2]=1; s[1]=1; s[0]=1;

end
endmodule




