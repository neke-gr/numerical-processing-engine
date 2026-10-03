function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients

  %nr de coef
  n = length(coef);
  %nr de puncte interpolare
  m = length(x_interp) ;
  %cream y_interp
  y_interp =zeros( m, 1) ;


  %gasim valorii poolinomului in x_interp
  i = 1;
  while i<=m
    valoare = 0;
    j =1;
    while j<= n
      p =j -1;
      valoare = valoare+ coef(j) *x_interp(i)^ p;
      j= j+ 1;
    endwhile

    %adaugam valorii
    y_interp(i) = valoare;
    i= i+1 ;
  endwhile

end
