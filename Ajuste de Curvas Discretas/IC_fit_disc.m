function[x,y] = IC_fit_disc(uv, n, tolerancia)

display("INICIO----------------------------------------------------------")

#t0 OK
#B OK
#Binv OK
#norm  parece OK
#B_ OK


m = length(uv)(1);
u = uv(:, 1);
v = uv(:, 2);

tk = t0(uv, m)


[Binv, Q2, B] = f_aux1(tk, n, m);

norma = norm(transpose(Q2)*u)^2 + norm(transpose(Q2)*v)^2

it = 0

dif_res = norma

while dif_res > tolerancia

  Pb = Q2 * transpose(Q2);
  B_ = bernstein_(tk, n);
  aux1 = B_ * Binv;  #AQUI

  J =  [Pb*diag(aux1*u) + transpose(aux1)* diag(Pb*u);
        Pb*diag(aux1*v) + transpose(aux1)* diag(Pb*v)]
  J = J(:, 2:end-1)

  r = -[(eye(m)-B*Binv)*u;  #AQUI
       (eye(m)-B*Binv)*v]

  par  = 0
  alpha = 1

  it2 = 0
  while par == 0 && it2 < 10

    taux = J \ -r*alpha;
    tkaux = [0; taux; 0] + tk

    norma_nova = f_norm(tkaux, n, u, v)


    if norma_nova < norma
      par = 1
    endif

    alpha  = alpha /2
    it2 += 1
  endwhile

  tk = tkaux

  [BT, Q2, B] = f_aux1(tk, n, m);

  it += 1
  dif_res = (-norma_nova + norma)/norma

  norma = norma_nova

end


xy = [B, zeros(m, n+1); zeros(m, n+1), B] \ [u; v];

x = xy(1:n+1, 1)
y = xy(n+2:end, 1)

it

b_plot(x, y, n, 100);
hold on
scatter(u, v, 300,'k', 'x');
axis([0 11 0 11]);
hold off

endfunction

#uv e uma matriz [m, 2] com as coordenadas dos pontos que serao ajustados
#n e  o grau da Bezier que sera ajustada
