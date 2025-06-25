function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients
  m = length(x_interp);
  n = length(coef);
  y_interp =zeros(n, 1);
  for i = 1:m
    sum = 0;
    for j = 1:n
      sum = sum + coef(j) * x_interp(i)^(j-1);
    endfor
    y_interp(i) = sum;
  endfor
  y_interp - y_interp';
end
