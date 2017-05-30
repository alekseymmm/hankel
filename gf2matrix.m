function A = gf2matrix(a, field_order)
A = [];
t = a;

for i=1:field_order
	column = de2bi(t.x, field_order, 2 ,"left-msb")';
	A = [column, A];
	t = t * gf(2, field_order);
end;

endfunction
