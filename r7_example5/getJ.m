function J = getJ(y, h)
% compute Jacobian for residual R
J = zeros(3, 3);
J(1,1) = 1; 
J(1,2) = -h;
J(2,1) = -2 * h * y(1);
J(2,2) = 1;
J(2,3) = -h;
J(3, 3) = 1;
end

