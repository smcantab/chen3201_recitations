function J = getJ(x, params)
% compute Jacobian for residual R
% x = [xn, Tn];
% params = [yn];

%Antoine coefficients, given in the problem statement %BENZENE
A1 = 6.90565;
B1 = 1211.033;
C1 = 220.790;

%TOLUENE
A2 = 6.95464; B2 = 1344.800; C2 = 219.480;

%need xn, yn, and Tn
xn = x(1); yn = params(1); Tn = x(2);

%Get the two saturation pressures
P1 = 10^(A1-B1/(Tn + C1)); P2 = 10^(A2-B2/(Tn + C2));

%To make calculation a little easier I also formulated the derivatives of 
%log10(P1) and loag10(P2)
d1 = B1/(Tn+C1)^2;
d2 = B2/(Tn+C2)^2;

%The Jacobian will be 2X2
J = zeros(2);

%Here is df1/dxn
J(1,1) = P1;
%Here is df1/dTn
J(1,2) = log(10)*xn*P1*d1;
%df2/dxn
J(2,1) = -P2;
%df2/dTn
J(2,2) = log(10)*(1-xn)*P2*d2;
end

