pkg load communications
pkg load parallel

function [result, min_matix, min_points] = CalcOnes()
n = 16;
m = 4;
field_order = 8;
field_size = 2^field_order;
num_tests = 5000;
result = [];

min_matrix = [];
min_num_ones = intmax;
min_points = [];

for j = 1:num_tests

  X = gf(zeros(1,n+m), field_order);
  D = gf(zeros(1,m), field_order);

  #for i = 1:n+m
  #    X(i) = gf(randint(1,1,[0, 255]), 8 ,285);%gf(2, 8, 285) ^ (i - 1);
  #    D(i) = gf(randint(1,1,[0, 255]), 8 ,285);
  #end
  rand_points = randperm(field_size) - 1;
  X = gf(rand_points(1:(n+m)), field_order);
  C = CodingMatrix(n, m, X(1:n), X(n+1:end), field_order);
  
  num_ones = 0;
  for i=1:numel(C)
    c = C(i);
    for j=1:8
        num_ones += ComputeWeight(c.x);
        c = c * gf(2,field_order);
    end;
  end
  if (num_ones < min_num_ones)
    min_num_ones = num_ones;
    min_matix = C;
    min_points = X;
  end
  result = [result, num_ones]; 
end

endfunction
#display("Calculation done.");

num_cores = 1
[y, min_matrix, min_points] = CalcOnes();
#y = pararrayfun(num_cores, @CalcOnes, zeros(1,num_cores));
hist(y, 400);
set(gca, 'XTick',min(y):400:max(y));
set(gca, 'fontsize', 15);;
set(get(gca,'child'),'FaceColor','green','EdgeColor','b');

#matrix to latex
#strcat("\\begin{bmatrix}\n",strrep(strrep(mat2str(A)," ","&"),";","\\\\\n")(2:end-1),"\n\\end{bmatrix}\n")
