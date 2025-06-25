function mat = read_mat(path)
  # TODO: Parse the .csv file and return the matrix of values (without row and column headers).
  fid = fopen(path, 'r');
  mat = csvread(path, 1, 1);
  fclose(fid);
end
