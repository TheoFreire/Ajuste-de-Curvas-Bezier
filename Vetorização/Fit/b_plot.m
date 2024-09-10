function [c] = b_plot(x, y, n, res)

t = [0:(1/res):1];

B = bernstein(t, n);
px = B*x;
py = B*y;

plot(px, py, 'linewidth', 3, 'r')
hold on
#{
if n == 3
  plot([x(1);x(2)], [y(1);y(2)], 'linewidth', 2, 'r')
  hold on
  plot([x(3);x(4)], [y(3);y(4)], 'linewidth', 2, 'r')
endif
#}
endfunction
