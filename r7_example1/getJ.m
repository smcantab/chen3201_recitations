function J = getJ(y, h)
% compute Jacobian for residual R
J = zeros(2, 2);
J(1,1) = 1 - h*(1 - 2 * y(1) - y(2)); 
J(1,2) = h * y(1);
J(2,1) = -h * (2 * y(2));
J(2,2) = 1 - h * (2 * y(1) - 1);
end

