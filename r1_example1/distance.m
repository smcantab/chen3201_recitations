function [r] = distance(a, b)
    % DISTANCE computes distance between vectors a and b
    % Input: row vectors a, b
    % Output: scalar r
    assert(isequal(size(a), [1 3]) & isequal(size(b), [1 3]))
    d = b - a; 
    r2 = dot(d, d); %can also write this as d.*d
    r = sqrt(r2);
end

