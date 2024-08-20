function [c] = b_plot(x, y, n, res)

t = [0:(1/res):1];

B = bernstein(t, n);
px = B*x;
py = B*y;

plot(px, py, 'linewidth', 2, 'b')
endfunction
