function R = getR(y, yold, h)
% compute residual vector
R = zeros(3, 1);
R(1,1) = y(1) - yold(1) - h * y(2); 
R(2,1) = y(2) - yold(2) - h * (y(1)^2 + y(3));
R(3,1) = y(3) - yold(3) - h;
end

