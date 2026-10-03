function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients

  %nr de intervale
  n = length(x) -1;
  m = size(x_interp);
  y_interp = zeros(m);

  j = 1;
  %nr de puncte
  k = length(y_interp);

  %calculam punctul de evaluare
  while j<= k
    valoare = x_interp(j);
    i=1;

    %cautam valoarea
    while i< n&& valoare > x(i+1)
      i = i+1;
    endwhile

    %extragem coeficientii
    a = coef(4*(i-1) +1);
    b = coef(4*(i-1)+2);
    c = coef(4*(i-1) +3);
    d = coef(4*(i-1)+4);

    distanta = valoare -x(i);
    y_interp(j) = a+ b*distanta + c*distanta^2 + d*distanta^3;

    j=j+1 ;

  endwhile
end
