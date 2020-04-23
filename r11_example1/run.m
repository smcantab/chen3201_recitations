clear;clc
close all

% initial conditions
nodes = 50;
y0 = zeros(nodes, 1);
y0(1) = 1;
x = linspace(0, 1, nodes);

%parameters
h = 1e-5;
t0 = 0;
tfinal = 1e-3;
nsteps = fix((tfinal-t0)/h);
iout = 1;

%run numerical solver
[tout, yout] = ivp_explicit_euler(t0, y0, h, nsteps, iout);

%Construct a loop to go through the number of Fourier modes to be %summed up for each value of K
kmax=100;
c_ex = zeros(kmax, nodes);
error = zeros(kmax, 1); 
for k=1:kmax
    c_ex(k, :) = exact_sol(x, tfinal, k);
    error(k) = norm(c_ex(k,:)-yout(nsteps, :));
end

figure
plot(x, yout(nsteps, :), 'k-', x, c_ex(10, :), 'k--')
xlabel('Position, x','FontSize',14)
legend('Numerical solution at t_f 0.01','Analytical solution (k=10) at t_f 0.01') 
ylabel('Concentration, c','FontSize',14)

figure
loglog(1:kmax, error, 'k-')
ylabel('||c_a - c_n||','FontSize',14)
xlabel('Number of Fourier modes in sum','FontSize',14)