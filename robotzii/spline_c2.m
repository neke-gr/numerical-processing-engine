function coef = spline_c2 (x, y)
% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

   %nr de intervale
  n = length(x) - 1;
  %nr total de coeficienti
  m = 4 * n ;

  %nr de elementele nenule
  nel = 16 * n;

  linie = zeros(nel, 1);
  coloana = zeros(nel, 1);
  valori = zeros(nel, 1);
  B = zeros(m, 1);

  count = 0;
  %linia currenta
  current = 1;

  %trecem toate punctele
  for i = 0:n-1
    count = count + 1;
    linie(count) = current;
    coloana(count) = 4 * i + 1;
    valori(count) = 1;
    B(current) = y(i + 1);
    current = current + 1;
  endfor

  %ultimul internval contine ultimul punct
  k = x(n + 1) - x(n);
  parametri = [1, k, k^2, k^3];

  for j = 1:4
    count = count + 1;
    linie(count) = current;
    coloana(count) = 4 * (n - 1) + j;
    valori(count) = parametri(j);
  endfor

  B(current) = y(n + 1);
  current = current + 1;

  for i = 0:n - 2
    k = x(i + 2) - x(i + 1);

    temp = [1, k, k^2, k^3];

    for j = 1:4
      count = count + 1;
      linie(count) = current;
      coloana(count) = 4 * i + j;
      valori(count) = temp(j);
    endfor
    count = count + 1;
    linie(count) = current;
    coloana(count) = 4 * (i + 1) + 1;
    valori(count) = -1;
    current = current + 1;

    %primul derivat
    d1 = [0, 1, 2 * k, 3 * k^2];
    for j = 2:4
      count = count + 1;
      linie(count) = current;
      coloana(count) = 4 * i + j;
      valori(count) = d1(j);
    endfor
    count = count + 1;
    linie(count) = current;
    coloana(count) = 4 * (i + 1) + 2;
    valori(count) = -1;
    current = current + 1;

    %al doilea derivat
    d2 = [0, 0, 2, 6 * k];
    for j = 3:4
      count = count + 1;
      linie(count) = current;
      coloana(count) = 4 * i + j;
      valori(count) = d2(j);
    endfor
    count = count + 1;
    linie(count) = current;
    coloana(count) = 4 * (i + 1) + 3;
    valori(count) = -2;
    current = current + 1;
  endfor

  count = count + 1;
  linie(count) = current;
  coloana(count) = 3;
  valori(count) = 2;
  current = current + 1;

  %conditile spline
  der = [0, 0, 2, 6 * (x(n + 1) - x(n))];
  for j = 3:4
    count = count + 1;
    linie(count) = current;
    coloana(count) = 4 * (n - 1) + j;
    valori(count) = der(j);
  endfor

  A = sparse(linie(1:count), coloana(1:count), valori(1:count), m, m);
  coef = A \ B;
end
