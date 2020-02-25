clear;clc

%Here are the paramters specified in the problem statement to determine the 
%rectification line
N = 15;
Rd = 1.95;
xD = 0.9995;

%Here are the Antoine Coefficients for Benzene and the atmospheric pressure 
%in mmHg. This is to determine the boiling point of Benzene using the given 
%equation since this will be a good initial guess for Tn
A1 = 6.90565;
B1 = 1211.033; 
C1 = 220.790;
P = 760; %mmHg

%Here are the initial guesses. I give both mole fractions as xD, and then 
%Tn as the boiling point of Benzene
xn = xD;
yn = xD;
Tn = B1/(A1 - log10(P))+C1; 
x = [xD, Tn]';
params(1) = yn;

%Need to specify the empty matrix beforehand so that I can add each stage 
%result as it is produced
xM = zeros(N,3);

%Run through all the stages
for k = 1:N
    %Get the result for stage k
    [x, success] = nonlinear_newton_raphson(x, params, 1e-4, 1000);
    %Add it to the matrix 
    xM(k,1) = x(1);
    xM(k, 2) = params(1);
    xM(k, 3) = x(2);
    %Then update yn such that is equals Eq(1) from the problem statement 
    %with xn-1 as the liquid mole fraction
    params(1) = (Rd*x(1) + xD)/(1+Rd);
end
%Here is the result to be outputted
result = xM;

%It is also plotted for each
n = 1:N;
h=figure;
plot(n,xM(:,1));
title('xn'); xlabel('stage number')
ylabel('xn (mole fraction)')
h=figure;
plot(n,xM(:,2));
title('yn'); xlabel('stage number')
ylabel('yn (mole fraction)')
h=figure;
plot(n,xM(:,3));
title('Tn'); xlabel('stage number');
ylabel('Tn (C)');