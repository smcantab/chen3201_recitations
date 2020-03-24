function [xout, yout] = ivp_implicit_euler_sys(x0, y0, h, nsteps, iout, tol)
% adapted from Dorfmann & Daoutidis "NUmerical Methods with Chemical
% Engineering applications
% x0 = vector, initial value for x
% y0 = vector, initial value for y
% h = step size
% iout = frequency to output x and y to [xout, yout]
% nsteps = number of steps
% tol = Newton-Raphson tolerance, default 1e-8
% requires the function getR(y, yold, h) and getJ(y, h) 
if nargin < 6
    tol = 1e-8; % default tolderance if tol is not passed as an argument
end
nout = fix(nsteps / iout); %number of output points (fix rounds towards zero)
xout = zeros(nout+1, 1); %pre-allocate xout
yout = zeros(nout+1, length(y0)); %pre-allocate yout
x = x0; xout(1) = x0; %set/store initial condition on x
y = y0; yout(1, :) = y0; %set/store initial condition on y
kout = 1; %counter for [xout, yout]
for i = 2:nsteps+1
    yold = y;
    R = getR(y, yold, h);
    count = 1; %keep truck of number of iterations
    while norm(R) > tol
        J = getJ(y, h);
        del = -J\R;
        y = y + del;
        R = getR(y, yold, h);
        count = count + 1;
        if count > 20 || max(y) == Inf || min(y) == -Inf
            warning('Newton Rhapson did not converge. \n')
            return
        end
    end
    x = x + h; %increase step
    if mod(i, iout) == 0 || i == nsteps + 1
        xout(kout) = x;
        yout(kout, :) = y;
        kout = kout + 1;
    end
end
end

