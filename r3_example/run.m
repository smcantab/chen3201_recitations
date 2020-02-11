clear;clc
x = zeros(2, 1);
b = [2; -2];

% run Jacobi solver on 2x2 system
A = [2 1; 1 -2];
linear_jacobi(A, b, x, 1e-8)

% run Gauss Seidel solver on 2x2 system
A = [2 1; 1 -2];
linear_gauss_seidel(A, b, x, 1e-8)

% test that sovlers fail for non diagonally dominant systems
try
    A = [2 1; 1 0];
    linear_jacobi(A, b, x, 1e-8);
catch exception
    getReport(exception)
end

% test methods on large random diagonally dominant system
n  = 10000;
A = rand(n);
x = zeros(n, 1);
b = n * rand(n, 1);
% construct a symmetric matrix
A = 0.5*(A+A');
% make matrix diagonally dominant (symmetric positive definite)
A = A + n * eye(n);
fprintf('run Jacobi solver \n')
linear_jacobi(A, b, x, 1e-8);
fprintf('run Gauss Seidel solver \n')
linear_gauss_seidel(A, b, x, 1e-8);