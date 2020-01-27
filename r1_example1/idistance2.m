function [ir2] = idistance2(a, b)
    % IDISTANCE2 computes the inverse square distance (1/r^2) between
    % vectors a and b
    % Input: row vectors a, b
    % Output: scalar ir2
    assert(isequal(size(a), [1 3]) & isequal(size(b), [1 3]))
    d = b - a; 
    r2 = dot(d, d); %can also write this as d.*d
    ir2 = 1/r2;
end

