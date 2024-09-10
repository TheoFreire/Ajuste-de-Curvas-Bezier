function [Entorno] = Entorno(Imagem, x,y)

  Entorno = zeros(8,1);
  Entorno(1,1) = Imagem(x-1,y-1);
  Entorno(2,1) = Imagem(x,y-1);
  Entorno(3,1) = Imagem(x+1,y-1);
  Entorno(4,1) = Imagem(x+1,y);
  Entorno(5,1) = Imagem(x+1,y+1);
  Entorno(6,1) = Imagem(x,y+1);
  Entorno(7,1) = Imagem(x-1,y+1);
  Entorno(8,1) = Imagem(x-1,y);

  for i = 1:8
    if Entorno(i,1) != 1
      Entorno(i,1) = 0;
    endif
  endfor

endfunction
