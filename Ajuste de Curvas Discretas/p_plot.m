function [c] = p_plot(px, py, t0, t1, res)

passo = (t1 - t0)/res;
t = [t0:passo:t1];

x = zeros(1, res);
for k = 1:(res)
    x(k) = px(t(k));
end

y = zeros(1, res);
for k = 1:(res)
    y(k) = py(t(k));
end

plot(x, y, 'linewidth', 1, '--k')
endfunction
