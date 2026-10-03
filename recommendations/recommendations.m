function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
# TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.

  %folosind functia read_mat luam matricea
  matrice = read_mat(path);
  % pregatim matricea cu preprocess
  matrice = preprocess(matrice, min_reviews);

  %aplicam svd pt matricea
  [U, S, V ]= svds(matrice, num_features);


  n = size(V,1 );
  similaritate = zeros(n, 1);
  % v contine temei placute din clienti
  liked_v= V(liked_theme, :)' ;

  %calculam similaritatea folosind cosine_similarity
  for i = 1:n
    similaritate(i) = cosine_similarity(liked_v, V(i, :)');
  end


  similaritate(liked_theme) = -1;

  %folosind sort sortam temele descend dupa similaritate
  [ scoruri , vector] = sort(similaritate, 'descend');  # avoid ~
  recoms = vector(1:num_recoms);
  recoms = recoms';

end


