function[Bij] = Bn_element(t, n, j)

Bij = ( factorial(n)/(factorial(j)*factorial(n-j)) )  * (t^j) * (1-t)^(n-j);

endfunction
