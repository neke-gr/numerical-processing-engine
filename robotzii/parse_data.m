function [x, y] = parse_data(filename)

  % citim filename si extragem n xn yn
  file= fopen(filename, 'r');
  n=fscanf(file, '%d', 1);
  xn=fscanf(file, '%f', n+1);
  yn=fscanf(file, '%f', n+1);

  x = xn';
  y= yn';

  fclose(file);
end
