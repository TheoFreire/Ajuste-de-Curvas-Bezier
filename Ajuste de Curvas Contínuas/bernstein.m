function[Bn] = bernstein(t, n)

m = length(t);
Bn = zeros(m, n);

for i = 1:m
  for j = 0:n
    Bn(i, j+1) = ( factorial(n)/(factorial(j)*factorial(n-j)) )  * (t(i)^j) * (1-t(i))^(n-j);
  end
end

endfunction
