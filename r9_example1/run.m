clear;clc

%setup the problem parameters
n = 51; %good to use a round + 1 to get even spacing
xl = -1;
xr = 1;
dx = (xr - xl)/(n-1);

%initialize the outputs
x = linspace(xl, xr, n);
y = -x.'; %this is a good initial guess for the problem but transpose (as a column)
tol = 1e-6;
kmax = 1000;
[y, success] = nonlinear_newton_raphson(y, dx, n, tol, kmax);

if success
fprintf('Converged on a solution.\n')
plot(x,y,'o',x,-x,'-r'), xlabel('x'), ylabel('y')
title('Recitation #9: Circle = solution, Line = initial guess')
end