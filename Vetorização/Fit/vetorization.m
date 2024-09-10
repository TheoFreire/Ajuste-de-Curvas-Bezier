function [spline] = vetorization(path, n)

  borda = CriaBorda(path);
  #borda = fliplr(borda);
  borda(:,2) = 500 - borda(:,2);
  [kp, indices] = keypixels(borda);

  m = length(indices)(1);

for i = 1:m-1

  uv = borda(indices(i):indices(i+1) , :);
  uv = [-uv(:,2),-uv(:,1)];
  if indices(i+1) - indices(i) == 1
    x = [uv(1,1)]
  y = [uv(1,2)]
  for k = 1:n
    x = [x; uv(2,1)];
    y = [y; uv(2,2)];
  endfor
    scatter(uv(:,1), uv(:,2), 30,'k', 'x');
    hold on
    b_plot(x, y, n, 150);
    hold on;
  else
    IC_fit_disc2(uv, n, 10^(-4));
  endif

endfor

uv = [borda(indices(m):end , :); borda(1,:)];
uv = [-uv(:,2),-uv(:,1)];
if indices(1) - indices(m) == 1
  x = [uv(1,1)]
  y = [uv(1,2)]
  for k = 1:n
    x = [x; uv(2,1)];
    y = [y; uv(2,2)];
  endfor
    scatter(uv(:,1), uv(:,2), 30,'k', 'x');
    hold on
    b_plot(x, y, n, 150);
    hold on;
else
    IC_fit_disc2(uv, n, 10^(-4));
endif

axis('xy')
hold off

endfunction

#PC
vetorization('C:\Users\Theo\OneDrive\Documentos\Unicamp\IC\Codigos\Codigos_Parte3\Imagens\Nike.jpg', 3);

#Notebook
vetorization('C:\Users\Theo\OneDrive\Documentos\Unicamp\IC\Codigos\Codigos_Parte3\Imagens\Puma.jpg', 3);
