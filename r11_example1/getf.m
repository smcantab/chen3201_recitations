function f = getf(y)
% compute residual vector
n = length(y);
dx = 1/(n-1);
f = zeros(n, 1);
f(1) = 1;
idx2 = 1/dx^2;
for i = 2:n-1
   f(i) = (y(i+1) - 2 * y(i) + y(i-1)) * idx2;
end
f(n) = 0;
end

