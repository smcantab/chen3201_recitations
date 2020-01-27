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

