function [par] = VizinhosRuins3(entorno) #retorna 1 se for ruim e 0 se n for
  par = 0;
  i = 0;

  while par == 0
    i += 1;
    par = entorno(i);
  endwhile

  if entorno(mod(i,8)+1) != 1 || entorno(mod(i+1,8)+1) != 1
    par = 0;
  endif

endfunction
