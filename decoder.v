
module decoder3to8(d,a,b,c);
input a,b,c;
output [7:0]d;
wire ab,bb,cb;

not(ab,a);
not(bb,b);
not(cb,c);

and(d[7],cb,bb,ab);
and(d[6],cb,bb,a);
and(d[5],cb,b,ab);
and(d[4],cb,b,a);
and(d[3],c,bb,ab);
and(d[2],c,bb,a);
and(d[1],c,b,ab);
and(d[0],c,b,a);
endmodule

module decoder3to8test;
reg a,b,c;
wire [7:0]d;
decoder3to8 d3t8(d,a,b,c);
initial
begin

     c=0; b=0; a=0; 
#100 c=0; b=0; a=1;
#100 c=0; b=1; a=0;
#100 c=0; b=1; a=1;
#100 c=1; b=0; a=0;
#100 c=1; b=0; a=1;
#100 c=1; b=1; a=0;
#100 c=1; b=1; a=1;

end
endmodule
