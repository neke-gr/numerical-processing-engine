function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    %vecotri treb sa ife coloane
    x = x';
    y = y';

    %nr de puncte interpolare si cream matricea
    n = length(x);
    A =zeros(n, n );

    %adaugam elementele
    i = 1;
    while i<=n
      j=1 ;
      while j<=n
        p = j-1;
        A(i, j) =x(i)^p;
        j = j+1 ;
      endwhile
      i = i+1 ;
    endwhile

    %rezolvam din nou sistemul
    coef = A \y;

endfunction
