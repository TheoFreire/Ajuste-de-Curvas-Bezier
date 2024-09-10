function [borda] = CriaBorda(caminho)

 im = imagem(caminho);
 #imshow(im);

 tic;
 [PontosRow, PontosCol] = find(im == 1);
 nPontos = size(PontosRow)(1);
 p = [PontosRow(1), PontosCol(1)];
 p_ = [p(1)+2,p(2)+2]; #ponto qualquer fora do entorno de p
 borda = [p];

 for k = 1:nPontos

   if im(p(1)-1,p(2)-1) == 1 && !isequal([p(1)-1,p(2)-1] , p_)
     borda = [borda; p(1)-1,p(2)-1];
     p_ = p;
     p = [p(1)-1,p(2)-1];

   elseif im(p(1),p(2)-1) == 1 && !isequal([p(1),p(2)-1] , p_)
     borda = [borda; p(1),p(2)-1];
     p_ = p;
     p = [p(1),p(2)-1];

   elseif im(p(1)+1,p(2)-1) == 1 && !isequal([p(1)+1,p(2)-1] , p_)
     borda = [borda; p(1)+1,p(2)-1];
     p_ = p;
     p = [p(1)+1,p(2)-1];

   elseif im(p(1)+1,p(2)) == 1 && !isequal([p(1)+1,p(2)] , p_)
     borda = [borda; p(1)+1,p(2)];
     p_ = p;
     p = [p(1)+1,p(2)];
     flag = 1;

   elseif im(p(1)+1,p(2)+1) == 1 && !isequal([p(1)+1,p(2)+1] , p_)
     borda = [borda; p(1)+1,p(2)+1];
     p_ = p;
     p = [p(1)+1,p(2)+1];

   elseif im(p(1),p(2)+1) == 1 && !isequal([p(1),p(2)+1] , p_)
     borda = [borda; p(1),p(2)+1];
     p_ = p;
     p = [p(1),p(2)+1];

   elseif im(p(1)-1,p(2)+1) == 1 && !isequal([p(1)-1,p(2)+1] , p_)
     borda = [borda; p(1)-1,p(2)+1];
     p_ = p;
     p = [p(1)-1,p(2)+1];

    elseif im(p(1)-1,p(2)) == 1 && !isequal([p(1)-1,p(2)] , p_)
     borda = [borda; p(1)-1,p(2)];
     p_ = p;
     p = [p(1)-1,p(2)];

   endif

   k += 1;
 endfor

  tempo = toc;
  fprintf('Borda em  %.4f seg \n', tempo)

 teste = 255*ones(size(im)(1),size(im)(2));
 for i = 1:nPontos
   teste(borda(i,1),borda(i,2)) = 0;
 endfor



 imshow(teste);

endfunction

#CriaBorda('C:\Users\Theo\OneDrive\Documentos\Unicamp\IC\Codigos_Parte3\Imagens\Nike.jpg')
