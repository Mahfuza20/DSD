module jkff(q,qb,j,k,clr,clk);
input clr,clk,j,k;
output q,qb;

wire a,b,c,d,e,f,cb;

nand(a,qb,j,clk,clr);
nand(b,q,k,clk);
nand(c,a,d);
nand(d,c,b,clr);

not(cb,clk);

nand(e,cb,c);
nand(f,d,cb);
nand(q,qb,e);
nand(qb,q,f,clr);

endmodule

module mod10(q,qb,clr,clk);
input clr,clk;
output [3:0]q,qb;

//wire a;

nand(clr,q[1],q[3]);

jkff jk0(q[0],qb[0],1,1,clr,clk);
jkff jk1(q[1],qb[1],1,1,clr,q[0]);
jkff jk2(q[2],qb[2],1,1,clr,q[1]);
jkff jk3(q[3],qb[3],1,1,clr,q[2]);

endmodule



module synchronous_updowncounter(q,qb,m,clr,clk);
input clr,clk,m;
output [2:0]q,qb;
wire a,b,c,d,e,f,g,mb;

not(mb,m);
jkff jk0(q[0],qb[0],1,1,clr,clk);
and(a,q[0],mb);
and(b,qb[0],m);
or(c,a,b);
jkff jk1(q[1],qb[1],c,c,clr,clk);
and(d,q[1],a);
and(e,qb[1],b);
or(f,d,e);
jkff jk2(q[2],qb[2],f,f,clr,clk);

endmodule








