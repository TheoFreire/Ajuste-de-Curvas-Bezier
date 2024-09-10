function [kp, indices] = keypixels(borda)

p1 = borda(1,:);
flag = 0;
i = 2;
n = size(borda)(1);

while flag == 0
  p2 = borda(i,:);
  if p1(1) != p2(1) & p1(2) != p2(2)
    inicio = p2(:);
    flag = 1;
  else
    p1 = p2(:);
    i += 1;
  endif
endwhile

pontosA = borda(1:i-1 , :);
pontosB = borda(i:n, :);

atu = inicio(:);
ant = borda(n, :);
i = 1; #localizacao do 1o pixel da sequencia
flag = 0;
kp = [0,0]; #a primeira linha de kp devera ser descartada depois
indices = [0];

while flag == 0
  prox = borda(rem(i+1,n),:);

  ##############################################
  if prox(1) == atu(1) #se o prox pixel mantem x
    #disp('x cte');
    contagem = 1; #numero a mais de pixels na sequencia
    x_cte = prox(1);
    x = x_cte;
    while x == x_cte

      if i+contagem == n
        prox = borda(1,:);
        break
      endif

      prox = borda(i + contagem + 1, :);
      x = prox(1);
      if x == x_cte
        contagem += 1;
      endif
    endwhile

    #Temos: posicao do inicio da seq (i), numero de pixels a mais na seq (contagem),
    #pixel anterior a seq (ant), 1o pixel da seq (atu), pixel sequinte a seq (prox)

    if ant(1) == prox(1)
      kp = [kp ; borda(ceil(i+(contagem/2)), :)];
      indices = [indices ; ceil(i+(contagem/2))];
    endif

    i = i + contagem +1;

    if i >= n-1
      break
    endif

    ant = borda(rem(i-1,n),:);
    atu = borda(rem(i,n),:);

   ##############################################
 elseif prox(2) == atu(2) #se o prox pixel mantem y
     #disp('y cte');
     contagem = 1; #numero a mais de pixels na sequencia
      y_cte = prox(2);
      y = y_cte;
    while y == y_cte

      if i+contagem == n
        prox = borda(1,:);
        break
      endif

      prox = borda(i + contagem + 1, :);
      y = prox(2);

      if y == y_cte
        contagem += 1;
      endif
    endwhile

    #Temos: posicao do inicio da seq (i), numero de pixels a mais na seq (contagem),
    #pixel anterior a seq (ant), 1o pixel da seq (atu), pixel sequinte a seq (prox)

    if ant(2) == prox(2)
      kp = [kp ; borda(ceil(i+(contagem/2)), :)];
      indices = [indices ; ceil(i+(contagem/2))];
    endif

    i = i + contagem +1;

    if i >= n-1
      break
    endif

    ant = borda(rem(i-1,n),:);
    atu = borda(rem(i,n),:);

    ##############################################
  elseif ant(1) == prox(1) #se o ant e o prox mantem x
    kp = [kp ; borda(i,:)];
    indices = [indices ; i];
    i += 1;
    ant = borda(rem(i-1,n),:);
    atu = borda(rem(i,n),:);

  elseif ant(2) == prox(2) #se o ant e o prox mantem y
    kp = [kp ; borda(i,:)];
    indices = [indices ; i];
    i += 1;
    ant = borda(rem(i-1,n),:);
    atu = borda(rem(i,n),:);

  ###################################################
  else
    #disp('nada cte');
      ant = atu(:);
      atu = prox(:);
      i += 1;
  endif

  if i >= n
    break
  endif

endwhile

kp = kp(2:end,:);
indices = indices(2:end,:)
scatter(borda(:,2), borda(:,1));
hold on
scatter(kp(:,2), kp(:,1), 200, 'r', 'x');
hold off

endfunction

#borda = [1,6 ; 2,6 ; 3,6 ; 4,6 ; 5,5 ; 5,4 ; 5,3 ; 5,2 ; 4,1 ; 3,0 ; 2,0 ; 1,1 ; 1,2 ; 0,3 ; 0,4 ; 0,5]
#borda = [6,7 ; 6,8 ; 7,9 ; 7,10 ; 8,11 ; 8,12 ; 8,13 ; 7,14 ; 6,14 ; 5,14 ; 4,14 ; 3,13 ; 3,12 ; 3,11 ; 4,10 ; 3,9 ; 2,8 ; 1,7 ; 1,6 ; 1,5 ; 1,4 ; 2,3 ; 3,2 ; 4,1 ; 5,2 ; 6,3 ; 7,4 ; 6,5 ; 6,6]
#borda = [0,0 ; 1,0 ; 2,1; 2,2 ; 1,3 ; 0,4 ; -1,3 ; -1,2 ; -1,1]


