function f = getf(x, y)
% compute residual vector
f = zeros(2, 1);
f(1,1) = y(1) * (1 - y(1)) - y(1) * y(2); 
f(2,1) = 2.0 * y(1) * y(2) - y(2);
end

