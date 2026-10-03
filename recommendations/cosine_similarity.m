function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.

  % Compute the dot product of A and B

  %produsul scalar
  numerator = A' * B;
  %normalele a lui A si B
  Anorm= norm(A, 2);
  Bnorm= norm(B, 2);
  %numitorul
  denominaor= Anorm* Bnorm ;

  %verificarea daca num e 0, daca nu facem calcularea
  if denominaor == 0
    similarity =0;
  else
    similarity = numerator /denominaor;
  endif
end
