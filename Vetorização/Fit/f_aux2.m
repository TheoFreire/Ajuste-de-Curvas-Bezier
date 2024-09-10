function[Binv, Q2, B] = f_aux2(t, n)

B = bernstein2(t, n);
[Q, R] = qr(B);

Q1 = Q(:, 1:n-1);
Q2 = Q(:, n:end);
R1 = R(1:n-1, :);
Binv = R1\transpose(Q1);

endfunction
