function out = is_diagonally_dominant(A)
    % tests if matrix is diagonally dominant
    % A = n x n coefficient matrix
    diagA = diag(A);
    A = A - diag(diagA); % zero out diagonal elements
    offdiagAsum = sum(abs(A), 2); % sum absolute off diagonal elements for each row
    out = all(abs(diagA) >= offdiagAsum);
end