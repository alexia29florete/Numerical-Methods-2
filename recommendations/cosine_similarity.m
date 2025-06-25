function similarity = cosine_similarity(A, B)
  # TODO: Compute the cosine similarity between two column vectors.
  modul_A = norm(A, 2);
  modul_B = norm(B, 2);

  %A_normat = A / modul_A;
  %B_normat = B / modul_B;

  produsul_AB = dot(A, B);
  similarity = produsul_AB / (modul_A * modul_B);
end
