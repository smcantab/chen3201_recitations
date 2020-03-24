clear;clc
close all

% initial conditions
x0 = 0;
y0 = [0.5; 5.0];

%parameters
h = 0.0001;
xfinal = 30.0;
nsteps = fix((xfinal-x0)/h);
iout = 1000;

%run
[xout, yout] = ivp_predictor_corrector_sys(x0, y0, h, nsteps, iout);

figure()
plot(xout, yout(:, 1), 'x', xout, yout(:, 2), '-r')
xlabel('time'); 
ylabel('y(t)');
title('Explicit Euler');

figure()
plot3(yout(:, 1), yout(:, 2), xout, '-o', 'LineWidth', 2)
zlabel('time'); 
xlabel('y1');
ylabel('y2');
