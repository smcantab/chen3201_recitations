function R = getR(x, params)
% compute residual vector
% x = [xn, Tn];
% params = [yn];

% Antoine coefficients, given in the problem statement %BENZENE
A1 = 6.90565;
B1 = 1211.033;
C1 = 220.790;

%TOLUENE
A2 = 6.95464; 
B2 = 1344.800; 
C2 = 219.480;

%Here is the atmospheric pressure in mmHg to match the saturated pressures 
P = 760; %mmHg

%xn, yn, and Tn are given to the program
xn = x(1); yn = params(1); Tn = x(2);

%Here the saturated pressures are calculated to make the calculation nicer
P1 = 10^(A1-B1/(Tn + C1)); P2 = 10^(A2-B2/(Tn + C2));

%And here are the functions
f1 = xn*P1 - yn*P;
f2 = (1-xn)*P2 - (1-yn)*P;

%You want a column vector because of how J is formed
R = [f1 f2]';

end
