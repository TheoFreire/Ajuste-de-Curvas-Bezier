function[t0] = t0(uv)

m = length(uv)(1);

dist = ((uv(2:end,1) - uv(1:end-1,1)).^2 + (uv(2:end,2) - uv(1:end-1,2)).^2).^(0.5);

d_total = sum(dist);
plus = 0;
t0 = zeros(m-2, 1);

for i = 1:m-2
  plus += dist(i);
  t0(i) = plus;
end

t0 = [0; t0./d_total; 1];

end
