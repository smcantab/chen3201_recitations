function R = getR(y, dx, n)
% adapted from Dorfman & Daoutidis "Numerical Methods with Chemical
% Engineering applications"
% y, function
% dx = (xl - xr)/(n-1)
% n = number of nodes
R = zeros(n, 1);
R(1, 1) = y(1) + 1;
R(n, 1) = y(n) - 1;
denom = 1/(dx)^2;
for i = 2 : n-1
   R(i, 1) = (y(i+1) - 2*y(i) + y(i-1))*denom + 2 * y(i) * (1 - y(i)^2);  
end
end

