function [w1, w2] = w(u, v, t, n)

  m = size(t)(1);
  b0 = zeros(m, 1);
  bn = zeros(m, 1);

  for i = 1:m
    b0(i, 1) =(1-t(i))^n;
  end

  for i = 1:m
    bn(i, 1) = t(i)^n;
  end

  w1 = u - (u(1)*b0 + u(m)*bn);
  w2 = v - (v(1)*b0 + v(m)*bn);

endfunction
