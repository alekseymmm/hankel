pkg load communications
pkg load parallel

function result = CalcOnes()
n = 64;
m = 16;
num_tests = 200;
result = [];
for j = 1:num_tests

  X = gf(zeros(1,n+m), 8 ,285);
  D = gf(zeros(1,m), 8 ,285);
  seed = 0;
  #for i = 1:n+m
  #    X(i) = gf(randint(1,1,[0, 255]), 8 ,285);%gf(2, 8, 285) ^ (i - 1);
  #    D(i) = gf(randint(1,1,[0, 255]), 8 ,285);
  #end
  X = gf(randint(1, n+m, [0,255]), 8, 285);
  C = CodingMatrix(n, m, X(1:n), X(n+1:end));
  
  num_ones = 0;
  for i=1:numel(C)
    c = C(i);
    for j=1:8
        num_ones += ComputeWeight(c.x);
        c = c * gf(2,8,285);
    end;
  end
  result = [result, num_ones]; 
end

endfunction
#display("Calculation done.");

num_cores = 32
y = pararrayfun(num_cores, @CalcOnes, zeros(1,32))
CalcOnes();
