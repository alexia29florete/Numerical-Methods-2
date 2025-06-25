function reduced_mat = preprocess(mat, min_reviews)
  # TODO: Remove all user rows from mat that have strictly less then min_reviews reviews.
  [n, m] = size(mat);
  lin_curenta = 1;
  reduced_mat = [];
  %numar cate recenzii diferite de zero exista
  for i = 1:n
    cnt = 0;
    for j = 1:m
      if mat(i, j) ~= 0
        cnt = cnt + 1;
      endif
    endfor
    if cnt >= min_reviews
      %daca am recenzii diferite de zero mai mare sau egale decat min_reviews
      %stochez linia respectiva in reduced_mat
      reduced_mat(lin_curenta, :) = mat(i, :);
      %trec la linia urmatoare din reduced_mat
      lin_curenta = lin_curenta + 1;
    endif
  endfor
end
