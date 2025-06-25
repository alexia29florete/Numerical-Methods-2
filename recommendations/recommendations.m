function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  # TODO: Get the best `num_recoms` recommandations similar with 'liked_theme'.
  mat = read_mat(path);
  mat = preprocess(mat, min_reviews);

  [U, S, V] = svds(mat, num_features);
  V = V';

  n = size(V, 2);
  similaritate = zeros(1, n);

  for i = 1:n
    similaritate(i) = cosine_similarity(V(:, liked_theme), V(:, i));
  endfor

  %https://www.mathworks.com/help/matlab/ref/double.sort.html
  [~, index] = sort(similaritate, "descend");
  %elimin liked_theme
  index = index(2:end);
  recoms = index(1:num_recoms);
end
