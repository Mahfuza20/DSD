module msff(q,qb,j,k,clr,clk);
input j,k,clr,clk;
output q,qb;
wire a,b,y,z,c,d,cb;

nand(a,qb,j,clk,clr);
nand(b,q,k,clk);
nand(y,a,z);
nand(z,b,y,clr);

not(cb,clk);

nand(c,y,cb);
nand(d,cb,z);
nand(q,c,qb);
nand(qb,q,d,clr);

endmodule

module synchronous_4bit_udctest(q,qb,m,clr,clk);
input m,clr,clk;
output [3:0]q,qb;
wire a,b,c,d,e,f,g,h,i,mb;

not(mb,m);

jkff1 jk0(q[0],qb[0],1,1,clr,clk);
and(a,q[0],mb);
and(b,qb[0],m);
or(c,a,b);

jkff1 jk1(q[1],qb[1],c,c,clr,clk);
and(d,q[1],a);
and(e,qb[1],b);
or(f,d,e);

jkff1 jk2(q[2],qb[2],f,f,clr,clk);
and(g,q[2],d);
and(h,qb[2],e);
or(i,g,h);

jkff1 jk3(q[3],qb[3],i,i,clr,clk);

endmodule






