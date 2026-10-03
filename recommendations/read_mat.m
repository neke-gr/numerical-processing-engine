function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).

  % citim matricea  folosind cvsread
   mat = csvread(path, 1,1) ;
end
