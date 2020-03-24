clear;clc
close all

% initial conditions
x0 = 0;
y0 = [2.0; -1.0; 0.0];

%parameters
h = 0.001;
xfinal = 1.0;
nsteps = fix((xfinal-x0)/h);
iout = 2;
tol = 1e-5;

%run
[xout, yout] = ivp_implicit_euler_sys(x0, y0, h, nsteps, iout, tol);

figure()
subplot(2, 1, 1);
plot(xout, yout(:, 1), '-ob');
xlabel('x'); 
ylabel('y');
title('Implicit Euler');
subplot(2, 1, 2);
plot(xout, yout(:, 2), '-or');
xlabel('x'); 
ylabel('dy');