function[t0] = t0(uv, m)

dist = zeros(m-1, 1);

for i = 1:m-1
  dist(i) = ((uv(i+1,1)-uv(i,1))^2 + (uv(i+1,2)-uv(i,2))^2)^0.5;
end

d_total = sum(dist);
plus = 0;
t0 = zeros(m-2, 1);

for i = 1:m-2
  plus += dist(i)/d_total;
  t0(i) = plus;
end

t0 = [0; t0; 1];

end
