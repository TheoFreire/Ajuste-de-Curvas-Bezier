function[Bn] = bernstein2(t, n)

m = size(t)(1);
Bn = zeros(m, n-1);

for i = 1:m
  for j = 1:n-1
    Bn(i, j) = (factorial(n)/(factorial(j)*factorial(n-j)))  * ((t(i))^j) * (1-t(i))^(n-j);
  end
end

endfunction
