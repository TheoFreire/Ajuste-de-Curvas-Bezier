function [par] = VizinhosRuins(entorno) #retorna 1 se for ruim e 0 se n for
  par = 0;
  i = 0;

  if entorno(2,1) == 1
    i = 2;
  elseif entorno(4,1) == 1
    i = 4;
  elseif entorno(6,1) == 1
    i = 6;
  elseif entorno(8,1) == 1
    i = 8;
  endif


  if i != 0
    if entorno(mod((i-3),8)+1,1) == 1 ||  entorno(mod((i-2),8)+1,1) == 1 || entorno(mod(i,8)+1,1) == 1 || entorno(mod((i+1),8)+1,1) == 1
      par = 1;
    endif
  endif

endfunction
