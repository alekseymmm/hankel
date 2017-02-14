function A = gf2matrix(a)
A = [];
t = a;

for i=1:8
	column = de2bi(t.x, 8, 2 ,"left-msb")';
	A = [column, A];
	t = t * gf(2, 8 ,285);
end;

endfunction
