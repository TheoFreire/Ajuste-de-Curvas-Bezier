function [NovaIm] = imagem(caminho) #recebe o path para a imagem
#PC
#imagem('C:\Users\Theo\OneDrive\Documentos\Unicamp\IC\Codigos\Codigos_Parte3\Imagens\Nike.jpg');
#imagem('C:\Users\Theo\OneDrive\Documentos\Unicamp\IC\Codigos\Codigos_Parte3\Imagens\Puma.jpg');

#Notebook
#imagem('C:\Users\theot\OneDrive\Documentos\Unicamp\IC\Codigos_Parte3\Imagens\Nike.jpg');

  pkg load image
  im = imread(caminho);
  xtot = size(im, 1);
  ytot = size(im, 2);

  tic;

  im(im < 127) = 1;
  im(im >= 127) = 255;

  tempo = toc;
  fprintf('Binarizado em  %.4f seg \n', tempo)

  #imshow(im)
  #endfunction

  tic;

  xtot += 2;
  ytot += 2;
  NovaIm = im;
  [PontosRow , PontosCol] = find(im == 1);



  for k = 1:size(PontosCol)(1)
    i = PontosRow(k);
    j = PontosCol(k);
    if im(i+1,j)==1 && im(i,j+1)==1 && im(i-1,j)==1 && im(i,j-1)==1
      NovaIm(i,j) = 255;
    endif
  endfor

  tempo = toc;
  fprintf('Oco em  %.4f seg \n', tempo)

  tic;

  #imshow(NovaIm)
  #endfunction

  flag = 1;

  while flag != 0
    flag = 0;
    [PontosRow , PontosCol] = find(im == 1);
      for k = 1:size(PontosCol)(1)

        i = PontosRow(k);
        j = PontosCol(k);

        if NovaIm(i,j) == 1
          entorno = Entorno(NovaIm, i,j);
          norma = sum(entorno(:));

          if norma < 2 #Retira pixels com 0 ou 1 vizinhos
            NovaIm(i,j) = 255;
            flag = 1;
          elseif (norma == 2) && (VizinhosRuins(entorno) == 1)
            NovaIm(i,j) = 255;
            flag = 1;
          elseif (norma == 3) && (VizinhosRuins3(entorno) == 1)
            NovaIm(i,j) = 255;
            flag = 1;
          endif
        endif
      endfor

  endwhile

  tempo = toc;
  fprintf('Limpo em  %.4f seg \n', tempo)

  imshow(NovaIm)
  endfunction
