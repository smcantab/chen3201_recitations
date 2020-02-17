function [x, success] = nonlinear_picard(getf, x, tol, kmax)
% adapted from Dorfmann & Daoutidis "NUmerical Methods with Chemical
% Engineering applications
% getf = anonymous funtions, defined as e.g. getf = @(x) x**2 + x - 1;
% x = scalar, initial guess
% tol = criteria for convergence
% max number of iterations allowed

f = getf(x); %evaluate function at initial guess x
k = 0; %counter

while abs(f) > tol
    x = x + f; %Picard's method 
    k = k + 1; %update counter
    f = getf(x); %update function value
    if k > kmax || x == Inf || x == -Inf
        warning('Did not converge. \n')
        break
    end
end

if k > kmax || x == Inf || x == -Inf
    success = 0;
else
    success = 1;
end
   
end

