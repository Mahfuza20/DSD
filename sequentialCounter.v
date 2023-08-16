module masterSlaveff(q,qb,j,k,clr,clk);
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

//lab question 2021
module sequestialCounter(q,clr,clk);
input clr,clk;
output [3:0]q;
wire [3:0]qb;
wire t,a,b,c,d,e,f;

xnor(a,q[3],q[0]);
masterSlaveff jk1(q[3],qb[3],a,a,clr,clk);

xor(b,q[3],q[2]);
masterSlaveff jk2(q[2],qb[2],b,b,clr,clk);

xor(c,q[2],q[1]);
masterSlaveff jk3(q[1],qb[1],c,c,clr,clk);

xor(d,q[1],q[0]);
masterSlaveff jk4(q[0],qb[0],d,d,clr,clk);

endmodule

//2018 6.b
module question(q,clr,clk);
input clr,clk;
output [2:0]q;
wire [2:0]qb;

wire a,b,c,d,e,f,g,h;
and(a,qb[0],qb[1],q[2]);
and(b,q[0],qb[1],qb[2]);
or(h,a,b);
masterSlaveff jk1(q[2],qb[2],h,h,clr,clk);

and(c,qb[0],qb[1],q[2]);
and(g,qb[0],q[1],qb[2]);
or(d,g,c);
masterSlaveff jk2(q[1],qb[1],d,d,clr,clk);

xnor(e,q[0],q[1]);
or(f,q[2],e);
masterSlaveff jk3(q[0],qb[0],f,f,clr,clk);
endmodule

//successful code

// 2017 6.a
module question1(q,clr,clk);
input clr,clk;
output [2:0]q;
wire [2:0]qb;

masterSlaveff jk1(q[2],qb[2],q[1],q[1],clr,clk);

masterSlaveff jk2(q[1],qb[1],qb[0],qb[0],clr,clk);

masterSlaveff jk3(q[0],qb[0],0,0,clr,clk);
endmodule

//successful





