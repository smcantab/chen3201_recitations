function R = getR(y, yold, h)
% compute residual vector
R = zeros(2, 1);
R(1,1) = y(1) - yold(1) - h * (y(1) * (1 - y(1)) - y(1) * y(2)); 
R(2,1) = y(2) - yold(2) - h * (2.0 * y(1) * y(2) - y(2));
end

