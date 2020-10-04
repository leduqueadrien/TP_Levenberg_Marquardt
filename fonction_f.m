
function F=fonction_f(d, a, X, Y)
    for i = 1:length(X)
      F(i) = somme_M_guaussiennes(a, X(i)) - Y(i);
      F=F';
    endfor
endfunction
