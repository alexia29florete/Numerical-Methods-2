function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
  n = length(x) - 1;
  m = length(x_interp);
  y_interp = zeros(m, 1);
  for i = 1:m
   xi = x_interp(i);

   k = 1;
   while k < n && xi >= x(k+1)
     k = k + 1;
   endwhile

   base = 4*(k - 1);
   a = coef(base + 1);
   b = coef(base + 2);
   c = coef(base + 3);
   d = coef(base + 4);

   y_interp(i) = a + b * (xi - x(k)) + c * (xi - x(k))^2 + d * (xi - x(k))^3;
  endfor
  y_interp = y_interp';
end
