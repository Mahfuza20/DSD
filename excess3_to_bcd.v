module excess3_To_bcd(b,e);
input [3:0]e;
output [3:0]b;

wire w,a,d,x,y,z,v;
//wire [3:0]eb;

not(b[0],e[0]);

xor(b[1],e[0],e[1]);

and(w,e[0],e[1],e[2]);
not(a,e[1]);
not(d,e[2]);
and(x,a,d);
and(y,d,b[0]);
or(b[2],w,x,y);

and(z,e[0],e[1],e[3]);
and(v,e[3],e[2]);

or(b[3],z,v);

endmodule


module excess3_To_bcdtest;

reg [3:0]e;
wire[3:0]b;

excess3_To_bcd be(b,e);

initial
begin

    e = 4'b 0000;
#100 e = 4'b 0001;
#100 e = 4'b 0010;
#100 e = 4'b 0011;
#100 e = 4'b 0100;
#100 e = 4'b 0101;
#100 e = 4'b 0110;
#100 e = 4'b 0111;
#100 e = 4'b 1000;
#100 e = 4'b 1001;
#100 e = 4'b 1010;
#100 e = 4'b 1011;
#100 e = 4'b 1100;
#100 e = 4'b 1101;
#100 e = 4'b 1110;
#100 e = 4'b 1111;
#100;

end
endmodule

