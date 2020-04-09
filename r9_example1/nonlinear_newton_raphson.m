function [y, success] = nonlinear_newton_raphson(y, dx, n, tol, kmax)
% adapted from Dorfman & Daoutidis "Numerical Methods with Chemical
% Engineering applications
% y = array, initial guess
% dx = (xl - xr)/(n-1)
% n = number of nodes
% tol = criteria for convergence
% kmax = max number of iterations allowed

R = getR(y, dx, n); %initialize residual  value
k = 0; %counter

while norm(R) > tol
    J = getJ(y, dx, n); %compute Jacobian
    J = sparse(J); % use banded solver in matlab
    del = -J\R; %Newton  Raphson method
    y = y + del; % update x
    k = k + 1; %update counter
    R = getR(y, dx, n); %update residual value
     if k > kmax || max(y) == Inf || min(y) == -Inf
         warning('Did not converge. \n')
         break
     end
end

if k > kmax || max(y) == Inf || min(y) == -Inf
    success = 0;
else
    success = 1;
end
   
end
