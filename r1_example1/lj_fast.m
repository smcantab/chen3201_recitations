function [energy] = lj_fast(a, b)
    % LJ_FAST computes energy between two particles at positions a and b
    % from the Lennard-Jones interaction potential. It is fast because it
    % avoids square roots and uses fewer multiplications
    % Input: row vectors a, b
    % Output: scalar energy
    ir2 = idistance2(a, b);
    ir6 = ir2 * ir2 *ir2;
    ir12 = ir6 * ir6;
    energy = ir6 + ir12;
end

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
