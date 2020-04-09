function J = getJ(y, dx, n)
% adapted from Dorfman & Daoutidis "Numerical Methods with Chemical
% Engineering applications"
% y, function
% dx = (xl - xr)/(n-1)
% n = number of nodes
J = zeros(n);
J(1, 1) = 1;
J(n, n) = 1;
denom = 1/(dx)^2;
for i = 2 : n-1
   J(i, i-1) = denom;
   J(i, i) = - 2 * denom + 2 - 6 * y(i)^2;
   J(i, i+1) = denom;
end
end

