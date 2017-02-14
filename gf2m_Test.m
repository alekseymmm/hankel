pkg load communications
a = gf(2, 8 ,285);
b = gf(234, 8 , 285);
d = gf(200, 8 , 285);

B = gf2matrix(b);

D = de2bi(d.x, 8, 2 ,"left-msb")';

display("b*d = ")
de2bi((b*d).x, 8, 2, "left-msb")'
display("B*D = ")
mod(B * D, 2)

#ComputeWeight((b*d).x)

