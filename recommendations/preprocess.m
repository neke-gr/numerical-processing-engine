function reduced_mat = preprocess(mat, min_reviews)

  %cream matricea
  reduced_mat = [ ] ;
  %nr de lini/clientii
  n = size(mat, 1);

  %pastram clientii cu min_reviews si trecem prin fiecare client
  i = 1;
  while i <= n
    linie = mat(i, :);

    j =1;
    suma =0;
    k=length(linie);
    while j<=k
      if linie(j) > 0
        suma=suma +1;
      endif
      j =j+1;
    endwhile
    if suma >= min_reviews
      reduced_mat = [reduced_mat; linie];
    endif

    i =i+1 ;

  endwhile
end
