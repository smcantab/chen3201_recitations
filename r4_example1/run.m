clear;clc

getf= @(x) x^2 - 3*x + 2;

xinit = [-0.1 0.6 1.99 2.01];
tol = 1e-8;
maxcount = 10000;

for i = 1:length(xinit)
   [root, success] = nonlinear_picard(getf, xinit(i), tol, maxcount);
   fprintf('xinit: %.3f root: %.3f sucess: %i \n', xinit(i), root, success)
end
