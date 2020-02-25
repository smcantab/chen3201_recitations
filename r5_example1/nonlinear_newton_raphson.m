function [x, success] = nonlinear_newton_raphson(x, params, tol, kmax)
% adapted from Dorfmann & Daoutidis "NUmerical Methods with Chemical
% Engineering applications
% x = scalar, initial guess
% tol = criteria for convergence
% max number of iterations allowed

R = getR(x, params); %initialize residual  value
k = 0; %counter

while norm(R) > tol
    J = getJ(x, params); %compute Jacobian
    del = -J\R; %Newton  Raphson method
    x = x + del; % update x
    k = k + 1; %update counter
    R = getR(x, params); %update residual value
     if k > kmax || max(x) == Inf || min(x) == -Inf
         warning('Did not converge. \n')
         break
     end
end
disp(x)
if k > kmax || max(x) == Inf || min(x) == -Inf
    success = 0;
else
    success = 1;
end
   
end

