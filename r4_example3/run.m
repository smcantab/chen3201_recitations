clear;clc

getf = @(x) sin(pi*x);
getdf = @(x) pi*cos(pi*x);

xinit = linspace(0, 2, 201);
roots = zeros(length(xinit), 1);
success = zeros(length(xinit), 1);
tol = 1e-10;
maxcount = 100000;

for i = 1:length(xinit)
   [roots(i), success(i)] = nonlinear_newton(getf, getdf, xinit(i), tol, maxcount);
   if ~success(i) %check if successful, we expect the method to fail when rem(x, 0.5) = 0
        roots(i) = [];   %remove entry
        success(i) = []; %remove entry
   end
end

plot(xinit, roots, '-o', 'MarkerSize', 10)
hold on
plot(xinit, 3*pi*abs(arrayfun(getf, xinit)), '-r', xinit, 3*abs(arrayfun(getdf, xinit)), '--b', 'LineWidth', 2)
hold off
grid on, grid minor
xlabel('Initial guess for x'), ylabel('Root from Newton Method')
legend('roots', '|f|', '|df|')