function[norma] = f_norm(t, n,  u, v)

B = bernstein(t, n);
[Q, R] = qr(B);
Q2 = Q(:, (n+2):end);

norma = norm( transpose(Q2)*u )^2 + norm( transpose(Q2)*v )^2;

endfunction
