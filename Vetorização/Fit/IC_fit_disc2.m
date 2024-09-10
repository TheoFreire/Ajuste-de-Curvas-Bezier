function[x,y] = IC_fit_disc2(uv, n, tolerancia)
#IC_fit_disc2(uv, 3, 10^(-4))

display("INICIO----------------------------------------------------------");

m = length(uv)(1);
u = uv(:, 1);
v = uv(:, 2);

tk = t0(uv);

[Binv, Q2, B] = f_aux2(tk, n);

[w1 , w2] = w(u, v, tk, n);

norma = norm(transpose(Q2)*w1)^2 + norm(transpose(Q2)*w2)^2;
#norma = f_norm(tk, n, w1, w2)

it = 0;

dif_res = norma;

while dif_res > tolerancia

  Pb = Q2 * transpose(Q2);
  B_ = bernstein_2(tk, n);
  aux1 = B_ * Binv;

  J =  [Pb*diag(aux1*w1) + transpose(aux1)* diag(Pb*w1);
        Pb*diag(aux1*w2) + transpose(aux1)* diag(Pb*w2)];
  J = J(:, 2:end-1);

  r = -[(eye(m)-B*Binv)*w1;
       (eye(m)-B*Binv)*w2];

  par  = 0;
  it2 = 0;
  taux = -2*(J \ r);
  alpha = 0.8;
  norma;
  while par == 0 && it2 < 10

  #{
    taux = taux/2;
    tkaux = [0; taux; 0] + tk;
    [w1 , w2] = w(u, v, tkaux, n);
    nova_norma = f_norm(tkaux, n, w1, w2);

    if nova_norma < norma
      par = 1;
    endif
  #}

    taux = taux/2;
    tkaux = tk - [0; taux; 0];
    [w1 , w2] = w(u, v, tkaux, n);
    nova_norma = f_norm(tkaux, n, w1, w2);


    #if norma - nova_norma > alpha/2
    if norma > nova_norma
      par = 1;
    endif

    #}

    it2 += 1;

endwhile

  tk = tkaux;

########################################

  [w1 , w2] = w(u, v, tk, n);

########################################

  [BT, Q2, B] = f_aux2(tk, n);

  it += 1;
  dif_res = (-nova_norma + norma)/norma;
  norma = nova_norma;

end

it
#

xy = [B, zeros(m, n-1); zeros(m, n-1), B] \ [w1; w2];

x = [u(1,1) ; xy(1:n-1, 1) ; u(m,1)];
y = [v(1,1) ; xy(n:end, 1) ; v(m,1)];

b_plot(x, y, n, 100);
hold on
scatter(u, v, 30,'k', 'o');
#axis([0 18 0 14]);
hold on

endfunction

uv = [1,1 ; 1,2 ; 2,3 ; 2,4 ; 2,5 ; 3,6 ; 3,7 ; 4,7 ; 4,8 ; 5,8 ; 6,9 ; 7,9 ; 8,9 ; 9,9 ; 10,8 ; 10,7]
uv = [1,1 ; 1,2 ; 1,3 ; 2,3 ; 2,4 ; 3,4 ; 4,5 ; 5,5 ; 6,4]
uv = [1,1 ; 1,2 ; 1,3 ; 1,4 ; 2,5 ; 2,6 ; 2,7 ; 2,8 ; 3,9 ; 3,8 ; 3,7 ; 4,6 ; 4,5 ; 4,4 ; 4,3 ; 4,2 ; 4,1]
uv = [-1,2 ; -0.8,1.928 ; -0.7, 1.847 ; -0.5 , 1.625 ; -0.4 , 1.496 ; -0.2 , 1.232 ; 0.333, 0.815; 0.5 , 0.875 ; 0.6 , 0.976 ; 0.7 , 1.133 ; 0.8 , 1.352]


#uv e uma matriz [m, 2] com as coordenadas dos pontos que serao ajustados
#n e  o grau da Bezier que sera ajustada
#Dennis Schnabel
