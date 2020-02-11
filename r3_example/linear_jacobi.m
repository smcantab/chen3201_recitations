function x = linear_jacobi(A, b, x, tol)
% adapted from Dorfmann & Daoutidis "NUmerical Methods with Chemical
% Engineering applications
% A = n x n coefficient matrix
% b = n x 1 vector
% x = n x 1 vector of initial guesses
if nargin < 4
    tol = 1e-8; % default tolderance if tol is not passed as an argument
end
if not(is_diagonally_dominant(A))
    error('Matrix A is not diagonally dominant, aborting. \n')
end
count = 0;
n = length(b);
max_count = 100; % max number of iterations, hardcoded
err = norm(A*x - b);
while err > tol
    xold = x; % store old value
    x = b - A * xold;
    for i = 1:n
        x(i) = x(i) / A(i,i) + xold(i);
    end
    %update counter and check if exceeded max_count
    count = count + 1;
    if count > max_count
        fprintf('Did not converge at k = %3d.\n', count)
        x = 0;
        break
    end
    % compute error and display on screen
    err = norm(x-xold);
    fprintf('jacobi solver k = %3d \t err = %6.4e \n', count, err)
end

end