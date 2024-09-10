function[Binv, Q2, B] = f_aux1(t, n, m)

B = bernstein(t, n);
[Q, R] = qr(B);

Q1 = Q(:, 1:end-(m-(n+1)))
Q2 = Q(:, (n+2):end)
R1 = R(1:(n+1), :);
Binv = R1\transpose(Q1);

endfunction
