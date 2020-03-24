function [xout, yout] = ivp_rk4_sys(x0, y0, h, nsteps, iout)
% adapted from Dorfmann & Daoutidis "NUmerical Methods with Chemical
% Engineering applications
% x0 = vector, initial value for x
% y0 = vector, initial value for y
% h = step size
% iout = frequency to output x and y to [xout, yout]
% nsteps = number of steps
% requires the function getf(x, y) 
nout = fix(nsteps / iout); %number of output points (fix rounds towards zero)
xout = zeros(nout+1, 1); %pre-allocate xout
yout = zeros(nout+1, length(y0)); %pre-allocate yout
x = x0; xout(1) = x0; %set/store initial condition on x
y = y0; yout(1, :) = y0; %set/store initial condition on y
kout = 1; %counter for [xout, yout]
for i = 2:nsteps+1
    k1 = getf(x, y);
    k2 = getf(x + 0.5*h, y + 0.5*h*k1);
    k3 = getf(x + 0.5*h, y + 0.5*h*k2);
    k4 = getf(x + h, y + h*k3);
    y = y + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
    x = x + h; %increase step
    if mod(i, iout) == 0 || i == nsteps + 1
        xout(kout) = x;
        yout(kout, :) = y;
        kout = kout + 1;
    end
end

end

