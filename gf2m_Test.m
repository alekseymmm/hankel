pkg load communications
#a = gf(2, 8 ,285);
a = gf(234, 8 , 285);
b = gf(200, 8 , 285);

A = gf2matrix(a);

B = de2bi(d.x, 8, 2 ,"left-msb")';

display("a*b = ")
de2bi((a*b).x, 8, 2, "left-msb")'
display("A*B = ")
mod(A * B, 2)

#ComputeWeight((b*d).x)

