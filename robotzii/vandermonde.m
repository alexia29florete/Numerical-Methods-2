function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    x = x';
    y = y';
    n = length(x);
    Vandermonde_matrix = zeros(n, n);
    for i = 1:n
      for j = 1:n
        Vandermonde_matrix(i, j) = x(i)^(j-1);
      endfor
    endfor

    coef = linsolve(Vandermonde_matrix, y);
    coef = coef';
endfunction
