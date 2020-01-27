function [energy] = lj(a, b)
    % LJ computes energy between two particles at positions a and b
    % from the Lennard-Jones interaction potential
    % Input: row vectors a, b
    % Output: scalar energy
    r = distance(a, b);
    energy = 1/r^6 + 1/r^12;
end