function[Bn_] = bernstein_(t, n)

m = length(t);
Bn_1 = bernstein(t, n-1);
zero_ = zeros(m, 1);

Bn_ = n*([zero_, Bn_1]-[Bn_1, zero_]);
vet_aux = zeros(1, n+1);
Bn_(1, :) = vet_aux;
Bn_(m, :) = vet_aux;

endfunction
