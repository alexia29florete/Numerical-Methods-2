function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% TOOD 1: si(xi) = yi, i = 0 : n - 1
	% TODO 2: s_n-1(xn) = yn
	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
	% TODO 6: s0''(x0) = 0
	% TODO 7: s_n-1''(x_n) = 0
	% Solve the system of equations

  %numarul de intervale
  n = length(x) - 1;
  %lungimea unui interval
  h = diff(x);
  x = x';
  y = y';
  a = y;

  %rezolv sistemul A*c = b_matrix pentru a afla c
  A = zeros(n+1, n+1);
  b_matrix = zeros(n+1, 1);

  A(1, 1) = 1;
  A(end, end) =1;

  for i = 2:n
    A(i, i-1) = h(i-1);
    A(i, i+1) = h(i);
    A(i, i) = 2*(h(i-1) + h(i));
    b_matrix(i) = 3 * (a(i+1) - a(i)) / h(i) - 3 * (a(i) - a(i-1)) / h(i-1);
  endfor

  c = linsolve(A, b_matrix);

  b = zeros(n, 1);
  d = zeros(n, 1);
  for i = 1:n
    d(i) = (c(i+1) - c(i)) / (3*h(i));
    b(i) = (a(i+1) - a(i)) / h(i) - h(i) / 3 * (2*c(i) + c(i+1));
  endfor

  coef = zeros(4 * n, 1);
  coef(1:4:end) = a(1:n);
  coef(2:4:end) = b;
  coef(3:4:end) = c(1:n);
  coef(4:4:end) = d;
end
